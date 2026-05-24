---
name: sane-mk
description: |
  Understands and extends the sane.mk GNU Make framework
  for shared deps, check, build, test, dist, debug, and system workflows.
  Use when:
    * editing this repo
    * adding Make targets/includes
    * wiring behavior through `SANE_*` variables
    * adopting sane.mk in another project
    * debugging why a target is not reachable
---

# sane.mk

## Quick model

* Choose the smallest entrypoint: `sane.mk`, `sane.std.mk`, `sane.extra.mk`, or `template/sane.tf.mk`.
* Extend behavior by appending leaf targets to `SANE_*` variables such as
  `SANE_DEPS`, `SANE_CHECK`, `SANE_TEST`, and `SANE_SYSTEM`.
* Keep top-level verbs declarative; put real work in `deps/*`, `check/*`, `test/*`, `system/*`, `debug/*`.

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
