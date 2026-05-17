GOOGLE_CLOUD_PROJECT_ID ?= $(shell $(GCLOUD) config get-value project 2>/dev/null)

# ------------------------------------------------------------------------------

.PHONY: gcp/auth
gcp/auth: ## Authenticate with GCP (Application Default Credentials).
	$(GCLOUD) auth application-default login

.PHONY: gcp/auth/quota
gcp/auth-quota: ## Set quota project for Application Default Credentials.
	$(GCLOUD) auth application-default set-quota-project $(GOOGLE_CLOUD_PROJECT_ID)

.PHONY: gcp/project/name
gcp/project/name: ## Show current GCP project name.
	$(GCLOUD) config get-value project

.PHONY: gcp/project
gcp/project: gcp/project/name
gcp/project: ## Show current GCP project info.
	$(GCLOUD) projects describe --format=json $(GOOGLE_CLOUD_PROJECT_ID)

.PHONY: gcp/services
gcp/services: gcp/project/name
gcp/services: ## List enabled GCP APIs/services.
	$(GCLOUD) services list --format=json --enabled --project $(GOOGLE_CLOUD_PROJECT_ID)

.PHONY: gcp/services/all
gcp/services/all: gcp/project/name
gcp/services/all: ## List all available GCP APIs/services.
	$(GCLOUD) services list --format=json --available --project $(GOOGLE_CLOUD_PROJECT_ID)
