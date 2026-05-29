# CLOUDSDK_ACTIVE_CONFIG_NAME
# CLOUDSDK_CORE_PROJECT
GOOGLE_CLOUD_PROJECT_ID ?= $(shell $(GCLOUD) config get-value project 2>/dev/null)
CLOUDSDK_CORE_ACCOUNT ?= $(shell $(GCLOUD) config get-value account 2>/dev/null)
CLOUDSDK_QUOTA_PROJECT ?= $(CLOUDSDK_CORE_PROJECT)

# ------------------------------------------------------------------------------

.PHONY: deps/gcp/config
deps/gcp/config:
	$(GCLOUD) config configurations describe "$(CLOUDSDK_ACTIVE_CONFIG_NAME)" --format="get(name)" >/dev/null 2>&1 \
		|| $(GCLOUD) config configurations create "$(CLOUDSDK_ACTIVE_CONFIG_NAME)" --no-activate --quiet >/dev/null
	$(GCLOUD) config set project "$(CLOUDSDK_CORE_PROJECT)" --quiet >/dev/null
	$(GCLOUD) config set billing/quota_project "$(CLOUDSDK_QUOTA_PROJECT)" --quiet >/dev/null
	[[ -n "$(CLOUDSDK_CORE_ACCOUNT)" ]] || { \
		$(ECHO_Q) "Please enter CLOUDSDK_CORE_ACCOUNT below. Press Ctrl+C to Cancel."; \
		read -s -r -p "CLOUDSDK_CORE_ACCOUNT=" CLOUDSDK_CORE_ACCOUNT; \
		[[ -n "$${CLOUDSDK_CORE_ACCOUNT:-}" ]] || exit 1; \
		$(GCLOUD) config set account "$${CLOUDSDK_CORE_ACCOUNT}" --quiet >/dev/null; \
	}

.PHONY: gcp/auth
gcp/auth: ## Authenticate with GCP.
	$(GCLOUD) auth application-default login --no-launch-browser


.PHONY: gcp/auth/%
gcp/auth/%: ## Authenticate with GCP as a service account.
	$(GCLOUD) auth application-default login --no-launch-browser --impersonate-service-account=$*


.PHONY: gcp/auth/quota
gcp/auth/quota: ## Set quota project for Application Default Credentials.
	$(GCLOUD) auth application-default set-quota-project $(GOOGLE_CLOUD_PROJECT_ID)


.PHONY: gcp/config
gcp/config: ## Show current GCP configuration.
	$(GCLOUD) config list


.PHONY: gcp/config/get/%
gcp/config/get/%: ## Get a GCP configuration value.
	$(GCLOUD) config get-value $*


.PHONY: gcp/config/new
gcp/config/new: ## Create a new GCP configuration.
	[[ -n "$${CLOUDSDK_CONFIG_NAME}" ]] || { \
		$(ECHO_Q) "Please enter CLOUDSDK_CONFIG_NAME below. Press Ctrl+C to Cancel."; \
		read -s -r -p "CLOUDSDK_CONFIG_NAME=" CLOUDSDK_CONFIG_NAME; \
		[[ -n "$${CLOUDSDK_CONFIG_NAME:-}" ]] || exit 1; \
	}; \
	[[ -n "$${CLOUDSDK_CORE_ACCOUNT}" ]] || { \
		$(ECHO_Q) "Please enter CLOUDSDK_CORE_ACCOUNT below. Press Ctrl+C to Cancel."; \
		read -s -r -p "CLOUDSDK_CORE_ACCOUNT=" CLOUDSDK_CORE_ACCOUNT; \
		[[ -n "$${CLOUDSDK_CORE_ACCOUNT:-}" ]] || exit 1; \
	}; \
	[[ -n "$${CLOUDSDK_CORE_PROJECT}" ]] || { \
		$(ECHO_Q) "Please enter CLOUDSDK_CORE_PROJECT below. Press Ctrl+C to Cancel."; \
		read -s -r -p "CLOUDSDK_CORE_PROJECT=" CLOUDSDK_CORE_PROJECT; \
		[[ -n "$${CLOUDSDK_CORE_PROJECT:-}" ]] || exit 1; \
	}; \
	[[ -n "$${CLOUDSDK_QUOTA_PROJECT}" ]] || { \
		$(ECHO_Q) "Please enter CLOUDSDK_QUOTA_PROJECT below. Press Ctrl+C to Cancel."; \
		read -s -r -p "CLOUDSDK_QUOTA_PROJECT=" CLOUDSDK_QUOTA_PROJECT; \
		[[ -n "$${CLOUDSDK_QUOTA_PROJECT:-}" ]] || exit 1; \
	}; \
	$(GCLOUD) config configurations create $${CLOUDSDK_CONFIG_NAME} \
		--no-activate \
		--account $${CLOUDSDK_CORE_ACCOUNT} \
		--project $${CLOUDSDK_CORE_PROJECT} \
		--billing-project $${CLOUDSDK_QUOTA_PROJECT}; \
	$(ECHO_INFO) "Authenticate via 'CLOUDSDK_CONFIG_NAME=$${CLOUDSDK_CONFIG_NAME} make gcp/auth'."; \
	$(ECHO_INFO) "Activate via     'CLOUDSDK_CONFIG_NAME=$${CLOUDSDK_CONFIG_NAME} make gcp/config/activate'."; \


.PHONY: gcp/config/activate
gcp/config/activate: gcp/configs
gcp/config/activate: ## Activate a GCP configuration.
	[[ -n "$${CLOUDSDK_CONFIG_NAME}" ]] || { \
		$(ECHO_Q) "Please enter CLOUDSDK_CONFIG_NAME below. Press Ctrl+C to Cancel."; \
		read -s -r -p "CLOUDSDK_CONFIG_NAME=" CLOUDSDK_CONFIG_NAME; \
		[[ -n "$${CLOUDSDK_CONFIG_NAME:-}" ]] || exit 1; \
	}; \
	$(ECHO_INFO) Activate in the current shell: export CLOUDSDK_CONFIG_NAME=$${CLOUDSDK_CONFIG_NAME}; \
	$(ECHO_INFO) Activate everywhere:           $(GCLOUD) config configurations activate $${CLOUDSDK_CONFIG_NAME}


.PHONY: gcp/configs
gcp/configs: ## List all GCP configurations.
	$(GCLOUD) config configurations list


.PHONY: gcp/project
gcp/project: gcp/config/get/project
gcp/project: ## Show current GCP project info.
	$(GCLOUD) projects describe --format=json $(GOOGLE_CLOUD_PROJECT_ID)


.PHONY: gcp/services
gcp/services: gcp/config/get/project
gcp/services: ## List enabled GCP APIs/services.
	$(GCLOUD) services list --format=json --enabled --project $(GOOGLE_CLOUD_PROJECT_ID)


.PHONY: gcp/services/all
gcp/services/all: gcp/config/get/project
gcp/services/all: ## List all available GCP APIs/services.
	$(GCLOUD) services list --format=json --available --project $(GOOGLE_CLOUD_PROJECT_ID)
