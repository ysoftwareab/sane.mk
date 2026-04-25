# sane.mk

I make (pun) a lot of things, and I want to keep them DRY.

The `docs` folder has some tips and tricks as well.

## Usage

I would have this repository as a submodule e.g. as a `sane.mk` folder,
and then fetch the submodule, if not already there,
and reference it at the top of the real `Makefile`:

```make
ifeq (,$(wildcard sane.mk/sane.extended.mk))
SANE_MK_INSTALL := $(shell git submodule update --init --recursive sane.mk)
ifneq (,$(filter undefine,$(.FEATURES)))
undefine SANE_MK_INSTALL
endif
endif

include sane.mk/sane.extended.mk
```

Similarly, if I just want bits and pieces of this:

```make
ifeq (,$(wildcard sane.mk/sane.mk))
SANE_MK_INSTALL := $(shell git submodule update --init --recursive sane.mk)
ifneq (,$(filter undefine,$(.FEATURES)))
undefine SANE_MK_INSTALL
endif
endif

include sane.mk/sane.mk
include sane.mk/target.help.inc.mk
```

## Ref

* http://blog.jgc.org/2013/02/updated-list-of-my-gnu-make-articles.html
* https://tech.davis-hansson.com/p/make/

## License

[MIT](LICENSE)
