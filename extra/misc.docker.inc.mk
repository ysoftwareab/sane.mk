DOCKER = $(call which,DOCKER,docker)
# NOTE The legacy builder is deprecated and will be removed in a future release.
export DOCKER_BUILDKIT=1
ifneq (,$(CI))
export BUILDKIT_PROGRESS=plain
endif

DOCKER_REGISTRY ?= docker.io

DOCKER_IMAGE_NAME ?= $(shell basename $(GIT_REMOTE_ORIGIN_SLUG))
DOCKER_IMAGE_SLUG ?= $(GIT_REMOTE_ORIGIN_SLUG)/$(DOCKER_IMAGE_NAME)
DOCKER_IMAGE ?= $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_SLUG)

DOCKER_ARCH ?= $(ARCH_NORMALIZED)
DOCKER_BUILD_PLATFORM ?= linux/amd64
DOCKER_BUILD_PLATFORM_CSV = $(subst $(space),$(,),$(strip $(DOCKER_BUILD_PLATFORM)))
DOCKER_BUILDX_NAME ?= $(DOCKER_IMAGE_NAME)-buildx
DOCKER_BUILD_ARGS += \
	--build-arg LABEL_ORG_OPENCONTAINERS_IMAGE_CREATED=$(shell $(DATE) -u +"%Y-%m-%dT%H:%M:%SZ") \
	--build-arg LABEL_ORG_OPENCONTAINERS_IMAGE_REVISION=$(GIT_HASH) \
	--build-arg LABEL_ORG_OPENCONTAINERS_IMAGE_SOURCE=$(GIT_REMOTE_ORIGIN_URL)
DOCKER_BUILD_TAGS := \
	--tag $(DOCKER_IMAGE):$(GIT_DESCRIBE) \
	--tag $(DOCKER_IMAGE):$(GIT_DESCRIBE_MAJOR) \
	--tag $(DOCKER_IMAGE):$(GIT_DESCRIBE_MAJOR_MINOR) \
	--tag $(DOCKER_IMAGE):latest

DOCKER_BUILD_LOCAL_ARGS += \
	$(DOCKER_BUILD_ARGS) \
	--platform linux/$(DOCKER_ARCH) \
	--tag $(DOCKER_IMAGE):local \
	--progress=plain

DOCKER_BUILDX = $(DOCKER) buildx --builder "$(DOCKER_BUILDX_NAME)"
DOCKER_BUILDX_ARGS += \
	$(DOCKER_BUILD_ARGS) \
	--platform $(DOCKER_BUILD_PLATFORM_CSV)

# ------------------------------------------------------------------------------

$(HOME)/.docker/config.json:
	$(MKDIR) -p $(HOME)/.docker
	$(TOUCH) $(HOME)/.docker/config.json


Dockerfile:
	$(CP) --no-clobber $(SANE_MK_ROOT)/Dockerfile* $(MAKE_PATH)/


.PHONY: docker/running
docker/running:
	$(DOCKER) info --format '{{.ID}}' &> /dev/null || { \
		$(ECHO_ERR) "Docker is not running."; \
		exit 1; \
	}


.PHONY: docker/buildx
docker/buildx:
	$(DOCKER) buildx version >/dev/null 2>&1 || { \
		$(ECHO_ERR) "Docker buildx is not installed."; \
		exit 1; \
	}
	$(DOCKER) buildx inspect "$(DOCKER_BUILDX_NAME)" >/dev/null 2>&1 || \
		$(DOCKER) buildx create \
			--driver docker-container \
			--name "$(DOCKER_BUILDX_NAME)" \
			--platform $(DOCKER_BUILD_PLATFORM_CSV)
	$(DOCKER) run --privileged --rm tonistiigi/binfmt --install all >/dev/null
	for PLATFORM in $(DOCKER_BUILD_PLATFORM); do \
		$(DOCKER_BUILDX) inspect --bootstrap \
			| $(GREP) "Platforms:" \
			| $(SED) "s/$$/,/" \
			| $(GREP) -q '[ ,]'$${PLATFORM}'\*\?,' || { \
				$(ECHO_ERR) "Docker buildx builder $(DOCKER_BUILDX_NAME) does not support $${PLATFORM}."; \
			exit 1; \
		}; \
	done


.PHONY: docker/login
docker/login: docker/running
docker/login: $(HOME)/.docker/config.json
docker/login: ## Login to the docker registry.
ifneq (,$(CI))
	$(ECHO) "$(DOCKER_PASSWORD)" | $(DOCKER) login -u "$(DOCKER_USERNAME)" --password-stdin "$(DOCKER_REGISTRY)"
else
	$(DOCKER) login $(DOCKER_REGISTRY)
endif


.PHONY: docker/pull
docker/pull: docker/login
docker/pull: Dockerfile
docker/pull: ## Pull associated docker image as local.
	$(DOCKER) pull $(DOCKER_IMAGE):v$(PKG_VSN)
	$(DOCKER) tag $(DOCKER_IMAGE):v$(PKG_VSN)	$(DOCKER_IMAGE):local


.PHONY: docker/push
docker/push: docker/login
docker/push: docker/buildx
docker/push: Dockerfile
docker/push: ## Build and push local docker image.
	$(DOCKER_BUILDX) build . $(DOCKER_BUILDX_ARGS) $(DOCKER_BUILD_TAGS) --push


.PHONY: docker/shell
docker/shell: docker/login
docker/shell: Dockerfile
docker/shell: ## Run a shell in the local docker image.
	$(DOCKER) run --pull=never --rm -it \
		--platform linux/$(DOCKER_ARCH) \
		--privileged \
		--network=host \
		--ipc=host \
		--volume "$(PWD):$(PWD):rw" \
		--workdir "$(PWD)" \
		$(DOCKER_IMAGE):local


.PHONY: docker/build
docker/build: docker/login
docker/build: docker/buildx
docker/build: Dockerfile
docker/build: ## Build docker image.
	$(DOCKER_BUILDX) build . $(DOCKER_BUILDX_ARGS)


.PHONY: docker/build/local
docker/build/local: docker/login
docker/build/local: Dockerfile
docker/build/local: ## Build local docker image - fast, single platform.
	$(DOCKER) build . $(DOCKER_BUILD_LOCAL_ARGS)


.PHONY: docker/build/local/debug
docker/build/local/debug: docker/login
docker/build/local/debug: docker/buildx
docker/build/local/debug: Dockerfile
docker/build/local/debug: ## Build and debug local docker image - fast, single platform.
	export BUILDX_EXPERIMENTAL=1; \
	$(DOCKER) buildx debug --on error --invoke /bin/bash build . $(DOCKER_BUILD_LOCAL_ARGS)


# ------------------------------------------------------------------------------

.PHONY: docker/images
docker/images: docker/running
docker/images: ## List images related to $DOCKER_IMAGE.
	$(DOCKER) image ls --filter "reference=$(DOCKER_IMAGE_SLUG):*"


.PHONY: docker/images/inspect
docker/images/inspect: docker/running
docker/images/inspect: ## Inspect the most recent image related to $DOCKER_IMAGE:local.
	$(DOCKER) image inspect $(DOCKER_IMAGE):local


.PHONY: docker/images/prune
docker/images/prune: docker/running
docker/images/prune: ## Remove images related to $DOCKER_IMAGE.
	IMAGES=$$($(DOCKER) image ls -q --filter "reference=$(DOCKER_IMAGE_SLUG):*"); \
	[[ -z "$${IMAGES}" ]] || for IMAGE in $${IMAGES}; do \
		$(DOCKER) image rm "$${IMAGE}" 2>/dev/null || $(ECHO) "Could not remove image $${IMAGE}"; \
	done


.PHONY: docker/containers
docker/containers: docker/running
docker/containers: ## List containers related to $DOCKER_IMAGE.
	$(DOCKER) container ls --all | $(HEAD) -n 1
	$(DOCKER) container ls --all \
		--format '{{.ID}}\t{{.Image}}' \
		| $(AWK) -F '\t' 'index($$2, "$(DOCKER_IMAGE_SLUG):") == 1 { print $$1 }' \
		| while IFS= read -r CONTAINER; do \
			$(DOCKER) container ls --all --filter "id=$${CONTAINER}" | $(TAIL) -n +2; \
		done


.PHONY: docker/containers/logs
docker/containers/logs: docker/running
docker/containers/logs: ## Show logs for the most recent container related to $DOCKER_IMAGE:local.
	CONTAINER=$$($(DOCKER) container ls --all \
		--format '{{.ID}}\t{{.Image}}' \
		| $(AWK) -F '\t' 'index($$2, "$(DOCKER_IMAGE_SLUG):local") == 1 { print $$1; exit }'); \
	if [ -z "$${CONTAINER}" ]; then \
		$(ECHO_ERR) "No containers related to $(DOCKER_IMAGE_SLUG):local found."; \
		exit 1; \
	fi; \
	$(DOCKER) container logs $${CONTAINER}


.PHONY: docker/containers/prune
docker/containers/prune: docker/running
docker/containers/prune: ## Remove containers related to $DOCKER_IMAGE.
	CONTAINERS=$$($(DOCKER) container ls --all \
		--format '{{.ID}}\t{{.Image}}' \
		| $(AWK) -F '\t' 'index($$2, "$(DOCKER_IMAGE_SLUG):") == 1 { print $$1 }'); \
	[ -z "$${CONTAINERS}" ] || for C in $${CONTAINERS}; do \
		$(DOCKER) container rm "$${C}" 2>/dev/null || $(ECHO) "Could not remove container $${C}"; \
	done
