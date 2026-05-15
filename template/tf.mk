MAKE_SELF_PATH := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
include $(MAKE_SELF_PATH)/../sane.extra.mk

# ------------------------------------------------------------------------------

TF_WORKSPACE ?= local
TF_BACKEND_STATE_FILE := .terraform/terraform.tfstate
TF_BACKEND_TYPE = $(shell { $(CAT) $(TF_BACKEND_STATE_FILE) 2>/dev/null || $(ECHO) "{}"; } \
	| $(JQ) -r '.backend.type // "local"')

TF_FILES := \
	backend.tf \
	data.tf \
	locals.tf \
	main.tf \
	outputs.tf \
	providers.tf \
	variables.tf \
	versions.tf \

TF_PLAN_FILE := $(TF_WORKSPACE).tfplan
TF_PLAN_FILE_ERROR := $(TF_PLAN_FILE).error.txt
TF_PLAN_FILE_TLDR := $(TF_PLAN_FILE).tldr.txt
TF_PLAN_FILE_TXT := $(TF_PLAN_FILE).txt
TF_APPLY_FILE := $(TF_PLAN_FILE).apply.txt

TF_GENERATED_FILE := generated.tf
TF_STATE_FILE := $(TF_WORKSPACE).tfstate

export TF_INPUT := false
export TF_LOG_PATH := $(TF_WORKSPACE).tflog.txt
export TF_LOG_PROVIDER := DEBUG
TF_VARS := $(shell $(TOUCH) variables.tfvars && $(ECHO) variables.tfvars)

TENV ?= $(call which,TENV,tenv)
TERRAFORM_DOCS ?= $(call which,TERRAFORM_DOCS,terraform-docs)
TFLINT ?= $(call which,TFLINT,tflint)

TERRAFORM_ENV ?=
SHELL_ENV += $(TERRAFORM_ENV)

TENV_ROOT ?= $(HOME)/.tenv
TENV_TF_VERSION = $(shell $(TENV) tf detect --install -q | $(GREP) "^Terraform " | $(AWK) '{print $$2}')
TERRAFORM_ ?= $(TENV_ROOT)/Terraform/$(TENV_TF_VERSION)/terraform
TERRAFORM = $(TERRAFORM_ENV) $(TERRAFORM_)
TERRAFORM_PLAN = 2> $(TF_PLAN_FILE_ERROR) $(TERRAFORM) plan $(TF_PLAN_FLAGS)

GREP_TF_PLAN_SKIP_PROGRESS = \
	$(GREP) -v \
	-e "Refreshing state\.\.\." \
	-e "Reading\.\.\." \
	-e "Still reading\.\.\." \
	-e "Read complete after" \

GREP_TF_PLAN_TLDR = \
	$(GREP) \
	-e "^  \?$(hash)" \
	-e "^      [+-~] " \
	-e "^Plan:" \
	-e "^No changes. Your infrastructure matches the configuration.$$" \

TF_PROVIDERS_LOCK_FLAGS = \
	-enable-plugin-cache \
	-platform=darwin_arm64 \
	-platform=linux_amd64

TF_PLAN_FLAGS = \
	-compact-warnings \
	-var-file=$(TF_VARS) \
	-out=$(TF_PLAN_FILE) \

TF_APPLY_FLAGS = \
	-auto-approve \
	-compact-warnings \

TFLINT_FLAGS = \
	--recursive \

define tf-plan
	$(TERRAFORM_PLAN) $(1) \
		| $(TEE) $(TF_PLAN_FILE_TXT) \
		| { $(GREP_TF_PLAN_SKIP_PROGRESS) || true; } || EXIT_STATUS=$$?; \
		>&2 $(CAT) $(TF_PLAN_FILE_ERROR); \
		$(STRIP_ANSI) -i $(TF_PLAN_FILE_TXT) $(TF_PLAN_FILE_ERROR); \
		exit $${EXIT_STATUS:-0}
	$(MAKE) tf/diff/tldr
endef

SANE_DEPS_TF += \
	deps/tf-core \
	deps/tenv \
	deps/tfdocs \
	deps/tflint \

SANE_DEPS_UPGRADE_TF += \
	deps/upgrade/tf-core \
	deps/tfdocs \

SANE_CHECK_TF += \
	check/tffmt \
	check/tfvalidate \
	check/tflint \

SANE_TEST_TF += \
	test/tf \

SANE_DEPS += \
	$(SANE_DEPS_TF) \

SANE_DEPS_FILES += \
	.terraform-docs.yml \
	.terraform-version \
	.tflint.hcl \
	$(TF_FILES) \

SANE_DEPS_UPGRADE += \
	$(SANE_DEPS_UPGRADE_TF) \

SANE_CHECK += \
	$(SANE_CHECK_TF) \

SANE_TEST += \
	$(SANE_TEST_TF) \

# ------------------------------------------------------------------------------

.terraform-docs.yml:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@


.terraform-version:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@


.tflint.hcl:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@


$(TF_FILES):
	$(TOUCH) $@


.PHONY: deps/tenv
deps/tenv:
	$(TENV) tf install


.PHONY: deps/tf-core
deps/tf-core: $(TF_BACKEND_STATE_FILE)
deps/tf-core:
	$(TERRAFORM) init -backend=false
	[[ -e .terraform.lock.hcl ]] || $(TERRAFORM) providers lock $(TF_PROVIDERS_LOCK_FLAGS)


.PHONY: deps/tfdocs
deps/tfdocs:
ifneq (,$(wildcard *.tf))
	if $(CAT) README.md | $(GREP) -q "BEGIN_TF_DOCS"; then \
		$(TERRAFORM_DOCS) markdown table .; \
	fi
else
	:
endif


.PHONY: deps/tflint
deps/tflint:
	$(TFLINT) --init


.PHONY: deps/tf
deps/tf: $(SANE_DEPS_TF)
deps/tf:
	:


.PHONY: deps/upgrade/tf-core
deps/upgrade/tf-core: $(TF_BACKEND_STATE_FILE)
deps/upgrade/tf-core:
	$(TERRAFORM) init -backend=false -upgrade
	$(TERRAFORM) providers lock $(TF_PROVIDERS_LOCK_FLAGS)


.PHONY: deps/upgrade/tf
deps/upgrade/tf: $(SANE_DEPS_UPGRADE_TF)
deps/upgrade/tf:
	:


.PHONY: check/tffmt
check/tffmt:
	$(TERRAFORM) fmt -check -diff -recursive || { \
		$(TERRAFORM) fmt -recursive 2>/dev/null; \
		exit 1; \
	}


.PHONY: check/tfvalidate
check/tfvalidate:
	# see https://github.com/hashicorp/terraform/issues/28490
	$(CAT) *.tf | $(GREP) -q "configuration_aliases" \
		|| $(TERRAFORM) validate


.PHONY: check/tflint
check/tflint:
	$(TFLINT) $(TFLINT_FLAGS)


.PHONY: check/tf
check/tf: $(SANE_CHECK_TF)
check/tf:
	:


.PHONY: test/tf
test/tf:
	$(TERRAFORM) test


$(TF_BACKEND_STATE_FILE): $(wildcard *.tf)
	if [[ -s backend.tf ]] && [[ -f terraform.tfstate ]] && [[ "$(TF_BACKEND_TYPE)" = "local" ]]; then \
		TF_INPUT=true $(TERRAFORM) init -migrate-state; \
	else \
		$(TERRAFORM) init -reconfigure; \
	fi


.PHONY: tf/diff/tldr
tf/diff/tldr:
	$(ECHO_INDENT)
	$(ECHO_INFO) "📖 See TLDR:"
	$(CAT) $(TF_PLAN_FILE_TXT) \
		| $(GREP_TF_PLAN_TLDR) \
		| $(SED) "/destroyed/s/^  /⚠️/g" \
		| $(SED) "/replaced/s/^  /⚠️/g" \
		| $(TEE) $(TF_PLAN_FILE_TLDR) \
		|| true
	$(ECHO_INDENT)
	$(ECHO_INFO) "📖 See TLDR in $(TF_PLAN_FILE_TLDR) ."
	$(ECHO_INFO) "🔍 See plan in $(TF_PLAN_FILE_TXT) ."
	[[ ! -e "$(TF_GENERATED_FILE)" ]] || [[ ! -s "$(TF_GENERATED_FILE)" ]] \
		|| $(ECHO_INFO) "📦 See imports in $(TF_GENERATED_FILE) ."
	[[ ! -e "$(TF_PLAN_FILE_ERROR)" ]] || [[ ! -s "$(TF_PLAN_FILE_ERROR)" ]] \
		|| $(ECHO_INFO) "⚠️ See errors in $(TF_PLAN_FILE_ERROR) ."


.PHONY: tf/diff
tf/diff: $(TF_BACKEND_STATE_FILE)
tf/diff: ## Diff changes.
tf/diff:
	$(RM) $(TF_LOG_PATH) $(TF_PLAN_FILE) $(TF_GENERATED_FILE)
	$(call tf-plan,-generate-config-out=$(TF_GENERATED_FILE) -lock=false)


.PHONY: tf/plan
tf/plan: $(TF_BACKEND_STATE_FILE)
tf/plan: check/tf
tf/plan: ## Plan and lock terraform state.
	$(RM) $(TF_LOG_PATH) $(TF_PLAN_FILE) $(TF_GENERATED_FILE)
	$(call tf-plan,-generate-config-out=$(TF_GENERATED_FILE))


.PHONY: tf/destroy
tf/destroy: $(TF_BACKEND_STATE_FILE)
tf/destroy: check/tf
tf/destroy: ## Plan destroy and lock terraform state.
	$(RM) $(TF_LOG_PATH) $(TF_PLAN_FILE)
	$(call tf-plan,-destroy)


.PHONY: tf/apply
tf/apply: $(TF_BACKEND_STATE_FILE)
tf/apply: ## Apply planned changes.
	$(RM) $(TF_APPLY_FILE)
	$(TERRAFORM) show $(TF_PLAN_FILE)
	{ \
		EXIT_STATUS=0; \
		$(TERRAFORM) apply $(TF_APPLY_FLAGS) $(TF_PLAN_FILE) \
			| $(TEE) $(TF_APPLY_FILE) \
			|| EXIT_STATUS=$$?; \
		$(MAKE) $(TF_BACKEND_STATE_FILE); \
		exit $${EXIT_STATUS:-0}; \
	}


.PHONY: tf/state
tf/state: tf/state/pull
tf/state:
	:


.PHONY: tf/state/pull
tf/state/pull: $(TF_BACKEND_STATE_FILE)
tf/state/pull: ## Pull terraform state.
	$(ECHO_INFO) "Pulling terraform state to $(TF_STATE_FILE) ..."
	$(TERRAFORM) state pull > $(TF_STATE_FILE)


.PHONY: tf/state/push
tf/state/push: $(TF_BACKEND_STATE_FILE)
tf/state/push: ## Push terraform state.
	$(ECHO_INFO) "Pushing $(TF_STATE_FILE) to terraform state..."
	$(TERRAFORM) state push $(TF_STATE_FILE)


.PHONY: tf/state/unlock/%
tf/state/unlock/%: $(TF_BACKEND_STATE_FILE)
tf/state/unlock/%: ## Unlock terraform state with LOCK_ID.
	$(TERRAFORM) force-unlock -force $*
