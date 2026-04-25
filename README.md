# sane.mk

For the future you to keep on enjoying GNU Make.

## Usage

You can either have this repository as a submodule,
and reference it at the top of the `Makefile`:

```make
ifeq (,$(wildcard sane.mk/sane.extended.mk))
SANE_MK_INSTALL := $(shell git submodule update --init --recursive sane.mk)
ifneq (,$(filter undefine,$(.FEATURES)))
undefine SANE_MK_INSTALL
endif
endif

include sane.mk/sane.extended.mk

# alternatively, include only specific features
# include sane.mk/sane.mk
# include sane.mk/target.help.inc.mk
```

or you can copy [`dist/sane.extended.mk`](./dist/sane.extended.mk)
(or just the core [`dist/sane.mk`](./dist/sane.mk))
to your project and include it at the top of the `Makefile`.

## Ref

* http://blog.jgc.org/2013/02/updated-list-of-my-gnu-make-articles.html
* https://tech.davis-hansson.com/p/make/

## License

[MIT](LICENSE)
