BACKLOG_DIR ?= backlog
BACKLOG_BIN ?= $(call which,BACKLOG,backlog)

BACKLOG_AGENTS_MD ?= https://raw.githubusercontent.com/MrLesk/Backlog.md/main/src/guidelines/agent-guidelines.md

# ------------------------------------------------------------------------------

.PHONY: backlog/update-agents
backlog/update-agents: ## Update Backlog.md AGENTS.md .
	$(MKDIR) $(BACKLOG_DIR)
	$(CURL) -o $(BACKLOG_DIR)/AGENTS.md $(BACKLOG_AGENTS_MD)


.PHONY: backlog
backlog: backlog/update-agents
backlog: ## Initialize Backlog.md.
	$(BACKLOG_BIN) init \
		--defaults \
		--agent-instructions none \
		--backlog-dir $(BACKLOG_DIR) \
		--integration-mode cli \
		$(PKG_NAME)
