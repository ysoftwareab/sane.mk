# see https://blog.melski.net/2010/11/30/makefile-hacks-print-the-value-of-any-variable/

# see https://www.gnu.org/software/make/manual/html_node/Origin-Function.html
MAKEFILE_ORIGINS := \
	default \
	environment \
	environment\ override \
	file \
	command\ line \
	override \
	automatic \
	\%

PRINTVARS_VARIABLES_IGNORE += \
	exportifdef \
	global-which \
	ifdef_any_of \
	ifndef_any_of \
	which \

PRINTVARS_MAKEFILE_ORIGINS_TARGETS += \
	$(patsubst %,printvars/%,$(MAKEFILE_ORIGINS)) \

# ------------------------------------------------------------------------------

.PHONY: printvars
printvars: printvars/file
printvars: ## Print all Makefile variables (file origin). Use printvar/<var> for only one.
	:


.PHONY: $(PRINTVARS_MAKEFILE_ORIGINS_TARGETS)
$(PRINTVARS_MAKEFILE_ORIGINS_TARGETS):
	@$(foreach V, $(sort $(filter-out $(PRINTVARS_VARIABLES_IGNORE),$(.VARIABLES))), \
		$(if $(filter $(@:printvars/%=%), $(origin $V)), \
			$(info $V=$($V)$(\n)$(space) origin = $(origin $V)$(\n)$(space) flavor = $(flavor $V)$(\n)$(space) value = $(value  $V)))) # editorconfig-checker-disable-line
	@$(foreach V, $(sort $(filter $(PRINTVARS_VARIABLES_IGNORE),$(.VARIABLES))), \
		$(if $(filter $(@:printvars/%=%), $(origin $V)), \
			$(info $V was skipped based on PRINTVARS_VARIABLES_IGNORE.)))


.PHONY: printvars/lazy
printvars/lazy:
	@$(foreach V, $(sort $(.VARIABLES_LAZY)), \
		$(info $V=$($V)))


.PHONY: printvar/%
printvar/%:
	$(info $*=$($*)$(\n)$(space) origin = $(origin $*)$(\n)$(space) flavor = $(flavor $*)$(\n)$(space) value = $(value  $*)) # editorconfig-checker-disable-line


.PHONY: printenv
printenv: ## Print all Makefile variables (printenv style). Use printenv/<var> for only one.
	@$(foreach V, $(sort $(filter-out $(PRINTVARS_VARIABLES_IGNORE),$(.VARIABLES))), \
		$(if $(filter file, $(origin $V)), \
			$(info $V=$($V))))


.PHONY: printenv/%
printenv/%:
	$(info $*=$($*))
