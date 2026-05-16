# ------------------------------------------------------------------------------

.PHONY: version/push
version/push:
	{ \
		$(GIT) push --no-follow-tags $(GIT_REMOTE_OR_ORIGIN) \
			HEAD:refs/heads/$(GIT_BRANCH) \
			refs/tags/$(GIT_TAG):refs/tags/$(GIT_TAG); \
	} || { \
		$(ECHO_ERR) "Failed to push. Reverting..."; \
		V= $(MAKE_DASH_F) version/revert; \
		exit 1; \
	}
	$(GH) release create --verify-tag --generate-notes $(GIT_TAG)
	$(GIT) push --no-follow-tags $(GIT_REMOTE_OR_ORIGIN) \
		HEAD:refs/heads/latest \
		HEAD:refs/heads/$$($(ECHO) $(GIT_TAG) | $(CUT) -d. -f1-2) \
		HEAD:refs/heads/$$($(ECHO) $(GIT_TAG) | $(CUT) -d. -f1)


.PHONY: version/revert
version/revert:
	$(GIT) status
	[[ -z "$(GIT_TAG)" ]] || { \
		$(GIT) tag --delete $(GIT_TAG); \
		$(GIT) reset --hard HEAD~1; \
	}


.PHONY: version/patch version/minor version/major
version/patch version/minor version/major:
	$(eval VSN_LEVEL := $(@:version/%=%))
	$(MAKE_DASH_F)
	$(NPM) version $(VSN_LEVEL) || { \
		$(ECHO_ERR) "Failed to bump version. Reverting..."; \
		V= $(MAKE_DASH_F) version/revert; \
		exit 1; \
	}
	$(MAKE_DASH_F) version/push


.PHONY: version
version: version/patch
version: ## Publish bugfixes. Use 'make version/minor' for features, 'make version/major' for breaking changes.
	:
