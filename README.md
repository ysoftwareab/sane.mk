# sane.mk

I make (pun) a lot of things, and I want to keep them DRY.

The `docs` folder has some tips and tricks as well.

# Usage

I would have this repository as a submodule e.g. as a `sane.mk` folder,
and then fetch the submodule, if not already there,
and reference it at the top of the real `Makefile`,
just after setting the `TOP` (root path for the current project):

```make
ifeq (,$(wildcard sane.mk/Makefile))
INSTALL_SANE_MK := $(shell git submodule update --init --recursive sane.mk)
ifneq (,$(filter undefine,$(.FEATURES)))
undefine INSTALL_SANE_MK
endif
endif

TOP := $(abspath $(shell dirname $(lastword $(MAKEFILE_LIST))))
include sane.mk/Makefile
```

Similarly, if I just want bits and pieces of this:

```make
ifeq (,$(wildcard sane.mk/Makefile))
INSTALL_SANE_MK := $(shell git submodule update --init --recursive sane.mk)
ifneq (,$(filter undefine,$(.FEATURES)))
undefine INSTALL_SANE_MK
endif
endif

include sane.mk/sane.mk
include sane.mk/target.help.inc.mk
```

# Ref

* http://blog.jgc.org/2013/02/updated-list-of-my-gnu-make-articles.html
* https://tech.davis-hansson.com/p/make/

# License

[Unlicense](LICENSE)
