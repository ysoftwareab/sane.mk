# sane.mk

For the future you to keep on enjoying GNU Make.

## Usage

You can either have this repository as a submodule (or even NodeJS/Python dependency),
and reference it at the top of the `Makefile`:

```make
ifeq (,$(wildcard sane.mk/sane.std.mk))
SANE_MK_INSTALL := $(shell git submodule update --init --recursive sane.mk)
ifneq (,$(filter undefine,$(.FEATURES)))
undefine SANE_MK_INSTALL
endif
endif

include sane.mk/sane.std.mk

# alternatively, include only specific features
# include sane.mk/sane.mk
# include sane.mk/target.help.inc.mk
```

or you can copy [`dist/sane.std.mk`](./dist/sane.std.mk)
(or just the core [`dist/sane.mk`](./dist/sane.mk))
to your project and include it at the top of the `Makefile`.

## sane.std.mk

`sane.std.mk` provides standard make targets with pre/post hooks:

* `all`
* `deps`
* `check`
* `clean`
* `build`
* `test`
* `dist`
* `ci`
* `debug`
* `system`

Each target pulls in dependencies from `SANE_*` variables (e.g., `SANE_DEPS`, `SANE_CHECK`),
while the pre/post hooks are the `prehook/*` and `posthook/*` targets (e.g., `prehook/deps`, `posthook/deps`).

By default, running `make` or `make all` is equivalent to `make deps check build`.

`ci` is meant to be called from CI pipelines. It defaults to `all test` but can be overridden with `SANE_CI`.

`deps/files` and `SANE_DEPS_FILES` is meant for generating untracked files.

`deps/gitignore` and `SANE_DEPS_GITIGNORE` is meant for updating `.gitignore` files.

## sane.extra.mk

Most often than not, you'll need `sane.extra.mk` though, which is the batteries-included entrypoint.
It includes the core targets from `sane.std.mk`, then layers in common extras for local/CI development:

* executables and helper macros (`exe.*.inc.mk`, `misc.*.inc.mk`)
* standard targets (`target.*.inc.mk`)
* local/system dependency setup targets (for `brew`, `corepack`, `uv`, and VS Code)
* lint and quality checks (for shell, YAML, Markdown, Python, secrets)
* test targets (`bats`, `pytest`)

## template/tf.mk

`template/tf.mk` is a Terraform-oriented Makefile template built on top of `sane.extra.mk`.

It provides:

* Terraform dependency/setup targets (e.g. `deps/tf-core`, `deps/tenv`, `deps/tflint`)
* Terraform checks (e.g. `check/tffmt`, `check/tfvalidate`, `check/tflint`)
* Terraform execution targets (e.g. `tf/diff`, `tf/plan`, `tf/destroy`, `tf/apply`)
* state helpers (e.g. `tf/state/pull`, `tf/state/push`, `tf/state/unlock/%`)
* generated docs support via `terraform-docs`

Default behavior uses `tenv` to detect/install the Terraform version,
standardizes plan/apply artifacts, and integrates Terraform targets into the
same `deps`, `check`, and `test` aggregations used elsewhere in this repo.

## Miscellaneous

* [extra/misc.backlog.inc.mk](./extra/misc.backlog.inc.mk) provides a `backlog` target
  to initialize [Backlog.md](https://github.com/MrLesk/Backlog.md).
* [extra/misc.gcp.inc.mk](./extra/misc.gcp.inc.mk) provides targets to interact with GCP projects via `gcloud`.

## Ref

* http://blog.jgc.org/2013/02/updated-list-of-my-gnu-make-articles.html
* https://tech.davis-hansson.com/p/make/

## License

[MIT](LICENSE)
