CPBAK = $(CP) --backup=numbered
CP_NOSYM = $(CP) -L
DIFF_SS = $(DIFF) -y -W $(COLUMNS)
EDITOR ?= $(call which,VI,vi)
FIND_Q = 2>/dev/null $(FIND)
FIND_Q_NOSYM = $(FIND_Q) -L
GREP_FILENAME = $(GREP) -rl
LS_ALL = $(LS) -A
MVBAK = $(MV) --backup=numbered
PATCH_STDOUT = $(PATCH) -o -
$(foreach VAR,CPBAK CP_NOSYM EDITOR FIND_Q FIND_Q_NOSYM GREP_FILENAME LS_ALL MVBAK PATCH_STDOUT,$(call make-lazy,$(VAR)))
$(foreach VAR,DIFF_SS,$(call make-lazy-once,$(VAR)))

COLUMN = $(call which,COLUMN,column)
CURL = $(call which,CURL,curl) -qfsSL
HEXDUMP = $(call which,HEXDUMP,hexdump)
JD = $(call which,JD,jd)
JQ = $(call which,JQ,jq)
YQ = $(call which,YQ,yq)
$(foreach VAR,COLUMN CURL HEXDUMP JD JQ YQ,$(call make-lazy,$(VAR)))

# git
GIT = $(call which,GIT,git)
GIT_LS = $(GIT) ls-files
GIT_LS_NEW = $(GIT_LS) --others --directory --no-empty-directory
GIT_LS_NOSYM = $(shell $(GIT_LS) | $(XARGS) -I{} sh -c 'test -L "$$1" || echo "$$1"' _ {})
GIT_LS_SUB = $(CAT) .gitmodules | $(GREP) "path =" | $(SED) "s/.\{0,\}path = //"
$(foreach VAR,GIT GIT_LS GIT_LS_NEW GIT_LS_NOSYM GIT_LS_SUB,$(call make-lazy,$(VAR)))

# node
export N_PREFIX = $(TMPDIR)
N = $(call which,N,n)
NODE = $(call which,NODE,node)
NPX = $(call which,NPX,npx)

# node corepack
COREPACK = $(call which,COREPACK,corepack)
ifeq (COREPACK_NOT_FOUND,$(COREPACK))
COREPACK = $(NPX) --yes corepack
endif
ifneq (,$(PKG_PACKAGE_MANAGER))
ifneq ($(PKG_PACKAGE_MANAGER),$(patsubst npm@%,%,$(PKG_PACKAGE_MANAGER)))
NPM = $(COREPACK) npm
endif
ifneq ($(PKG_PACKAGE_MANAGER),$(patsubst pnpm@%,%,$(PKG_PACKAGE_MANAGER)))
PNPM = $(COREPACK) pnpm
endif
endif

# python
PYTHON ?= $(call which,PYTHON,python)
PYTHON3 ?= $(call which,PYTHON3,python3)

# zip
UNZIP = $(call which,UNZIP,unzip) -oq
UNZIP_Z1 = $(call which,UNZIP,unzip) -Z1
VISUAL ?= $(EDITOR)
ZIP_NOSYM = $(call which,ZIP_NOSYM,zip) -r
ZIP = $(ZIP_NOSYM) -y
ZIPINFO = $(call which,ZIPINFO,zipinfo)
$(foreach VAR,UNZIP UNZIP_Z1 VISUAL ZIP_NOSYM ZIP ZIPINFO,$(call make-lazy,$(VAR)))

# zz
BREW ?= $(call which,BREW,brew)
DOT ?= $(call which,DOT,dot)
GCLOUD = $(call which,GCLOUD,gcloud)
OPENSSL3 = $(shell $(BREW) --prefix openssl@3)/bin/openssl
STRIP_JSON_COMMENTS = $(NPX) --yes strip-json-comments-cli@v3.0.0
