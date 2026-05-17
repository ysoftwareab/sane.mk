TASKWARRIOR ?= $(call which,TASKWARRIOR,task)

TASKWARRIOR_DIR ?= .task
TASKWARRIOR_EDITOR ?= $(call which,VI,vi)
export TASKRC ?= $(GIT_ROOT)/.taskrc

# ------------------------------------------------------------------------------

$(TASKRC):
	$(ECHO) "data.location=$(TASKWARRIOR_DIR)" >> $(TASKRC)
	$(ECHO) "news.version=$(shell $(TASKWARRIOR) --version)" >> $(TASKRC)

.PHONY: task
task: task/add
task: ## Add a new task.
	:

.PHONY: task/add
task/add: $(TASKRC)
task/add:
	TMP_FILE="$$($(MKTEMP))"; \
		trap '$(RM) "$${TMP_FILE}"' EXIT; \
		$(TASKWARRIOR_EDITOR) "$${TMP_FILE}" && \
		TASK_DESCRIPTION="$$($(CAT) "$${TMP_FILE}")" && \
		$(TASKWARRIOR) add "$${TASK_DESCRIPTION}"

.PHONY: task/list
task/list: $(TASKRC)
task/list: ## List tasks.
	$(TASKWARRIOR) list

.PHONY: task/list/all
task/list/all: $(TASKRC)
task/list/all: ## List all tasks including completed.
	$(TASKWARRIOR) all

.PHONY: task/start/%
task/start/%: $(TASKRC)
task/start/%: ## Start a task by ID.
	$(TASKWARRIOR) start $*

.PHONY: task/done
task/done: $(TASKRC)
task/done: ## Mark a task as done.
	$(TASKWARRIOR) done
