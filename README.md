# sane.mk

For the future you to keep on enjoying GNU Make.

## Usage

You can either have this repository as a submodule,
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

## target.std.inc.mk

Provides standard make targets (`all`, `deps`, `check`, `build`, `test`, `ci`, `debug`, `system`) with pre/post hooks.
Each target pulls in dependencies from `SANE_*` variables (e.g., `SANE_DEPS`, `SANE_CHECK`).
Defaults for `all` (default target i.e. `make` is equivalent to `make all`) are `deps check build`.

`ci` is meant for CI pipelines. It defaults to `all` but can be overridden with `SANE_CI`,
for instance to treat pull requests differently from main branch pushes.

`deps/files` is meant for generating untracked files.

`deps/gitignore` is meant for updatintg `.gitignore` files.

## Ref

* http://blog.jgc.org/2013/02/updated-list-of-my-gnu-make-articles.html
* https://tech.davis-hansson.com/p/make/

## License

[MIT](LICENSE)
