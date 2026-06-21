---
name: sane-mk
description: |
  Understands and extends the sane.mk GNU Make framework
  for shared deps, check, build, test, dist, debug, and system workflows.
  Detect a sane.mk repo by `include $(SANE_MK_ROOT)/...` in the Makefile or a
  generated `Makefile.lazy` with `SANE_*` variables.
  Use when:
    * editing this repo
    * adding Make targets/includes
    * wiring behavior through `SANE_*` variables
    * adopting sane.mk in another project
    * debugging why a target is not reachable
    * validating, linting, formatting, or testing in a sane.mk repo
      (the entrypoint is `make check` / `make test`, never direct tool calls)
    * editing any non-Make file in a sane.mk repo when you need to validate it
---

# sane.mk

## Quick model

* Choose the smallest entrypoint: `sane.mk`, `sane.std.mk`, `sane.extra.mk`, or `template/sane.tf.mk`.
* Extend behavior by appending leaf targets to `SANE_*` variables such as
  `SANE_DEPS`, `SANE_CHECK`, `SANE_TEST`, and `SANE_SYSTEM`.
* Keep top-level verbs declarative; put real work in `deps/*`, `check/*`, `test/*`, `system/*`, `debug/*`.

## Validation entrypoints

In a sane.mk repo, NEVER invoke linters/formatters/test runners directly
(e.g. `markdownlint`, `ruff`, `yamllint`, `shellcheck`, `pytest`). Always use:

* `make check` — lint, format, static analysis, secret scanning
* `make test` — tests
* `make all` — build
* `make clean` — clean generated files

`Makefile.lazy` resolves tool paths and the repo's config files (e.g.
`.markdownlintrc`, `.ruff.toml`) are wired into these targets. Direct
invocation bypasses that wiring and runs a strict subset of the checks.

## Repo rules

* `##` comments feed `make help`.
* Target names use `/`; keep `.PHONY` on its own line.
* Make vars use `$(VAR)`; bash vars use `$${VAR}`.
* Resolve tools with `$(call which,NAME,gname name)` into ALL_CAPS variables.
* Prefer wrappers like `$(MKDIR)`, `$(CP)`, `$(LN)`, `$(RM)` and lazy helpers like `$(call make-lazy-once,VAR)`.

## Common tasks

* Add a checker:

Use real tab characters in actual recipe lines.

```text
SANE_CHECK += \
  check/foo \

.PHONY: check/foo
check/foo: ## Check foo.
<TAB>$(FOO) --check .
```

* Add a system dependency:

```ruby
# Brewfile
brew "shellcheck"
```

Run `make system` or `make test/system/brewfile`.

* Add a generated file or folder:

```text
SANE_DEPS_FILES += config/generated.env
SANE_DEPS_FOLDERS += deps/folders/tmp

config/generated.env:
<TAB>$(TOUCH) $@
```

## Guardrails

* Do not reimplement `all`, `deps`, `check`, `build`, `test`, `dist`, `ci`,
  `clean`, `debug`, or `system` unless changing the framework itself.
* Preserve formatting and comment conventions; `help` output depends on them.
