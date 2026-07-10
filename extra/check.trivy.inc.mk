TRIVY ?= $(call which,TRIVY,trivy)
$(call make-lazy,TRIVY)

TRIVY_SCANNERS += \
	misconfig \
	secret \

TRIVY_SEVERITY += \
	HIGH \
	CRITICAL \

TRIVY_SKIP_DIRS += \

TRIVY_FLAGS += \
	--scanners $(subst $(space),$(,),$(strip $(TRIVY_SCANNERS))) \
	--severity $(subst $(space),$(,),$(strip $(TRIVY_SEVERITY))) \
	$(foreach DIR,$(TRIVY_SKIP_DIRS),--skip-dirs $(DIR)) \
	--exit-code 1 \

# ------------------------------------------------------------------------------

.PHONY: debug/trivy
debug/trivy:
	$(ECHO)
	$(ECHO_DO) "Debug Trivy..."
	$(ECHO) "TRIVY=$(TRIVY)"
	$(ECHO) "TRIVY_SCANNERS=$(TRIVY_SCANNERS)"
	$(ECHO) "TRIVY_SEVERITY=$(TRIVY_SEVERITY)"
	$(ECHO) "TRIVY_SKIP_DIRS=$(TRIVY_SKIP_DIRS)"
	$(ECHO) "TRIVY_FLAGS=$(TRIVY_FLAGS)"
	set -x && $(TRIVY) --version || true
	$(ECHO_DONE)


.PHONY: check/trivy
check/trivy:
	$(TRIVY) repo $(TRIVY_FLAGS) --quiet .


.PHONY: check/trivy/%
check/trivy/%:
	$(TRIVY) fs $(TRIVY_FLAGS) --quiet $*
