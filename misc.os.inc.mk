ARCH = $(shell $(UNAME) -m)
# https://github.com/containerd/containerd/blob/f2c3122e9c6470c052318497899b290a5afc74a5/platforms/platforms.go#L88-L94
# https://github.com/BretFisher/multi-platform-docker-build
ARCH_NORMALIZED = $(shell $(ECHO) $(ARCH) | $(SED) \
	-e "s|^aarch64$$|arm64|" \
	-e "s|^arm64/v8$$|arm64|" \
	-e "s|^armhf$$|arm|" \
	-e "s|^arm64/v7$$|arm|" \
	-e "s|^armel$$|arm/v6|" \
	-e "s|^i386$$|386|" \
	-e "s|^i686$$|386|" \
	-e "s|^x86_64$$|amd64|" \
	-e "s|^x86-64$$|amd64|" \
)
ARCH_SHORT = $(shell $(ECHO) $(ARCH) | $(GREP) -q "64" && $(ECHO) "x64" || $(ECHO) "x86")
ARCH_BIT = $(shell $(ECHO) $(ARCH) | $(GREP) -q "64" && $(ECHO) "64" || $(ECHO) "32")
$(foreach VAR,ARCH ARCH_NORMALIZED ARCH_SHORT ARCH_BIT,$(call make-lazy,$(VAR)))

OS = $(shell $(UNAME) | $(TR) "[:upper:]" "[:lower:]")
OS_SHORT = $(shell $(ECHO) $(OS) | $(SED) "s/^\([[:alpha:]]\{1,\}\).*\$$/\1/g")
$(foreach VAR,OS OS_SHORT,$(call make-lazy,$(VAR)))

SANE_DEBUG_OS = \
	debug/os \
	debug/os/$(OS_SHORT) \

# ------------------------------------------------------------------------------

.PHONY: debug/os
debug/os:
	$(ECHO)
	$(ECHO_DO) "Debug variables (OS)..."
	$(ECHO) "ARCH=$(ARCH)"
	$(ECHO) "ARCH_BIT=$(ARCH_BIT)"
	$(ECHO) "ARCH_NORMALIZED=$(ARCH_NORMALIZED)"
	$(ECHO) "ARCH_SHORT=$(ARCH_SHORT)"
	$(ECHO) "OS=$(OS)"
	$(ECHO) "OS_SHORT=$(OS_SHORT)"
	$(ECHO_DONE)


.PHONY: debug/os/darwin
debug/os/darwin:
	$(ECHO)
	$(ECHO_DO) "Debug OS (Darwin)..."
	set -x && /usr/bin/sw_vers || true
	set -x && /usr/bin/xcodebuild -version || true
	set -x && /usr/bin/xcode-select --print-path || true
	set -x && /usr/bin/xcrun --version || true
#	set -x && /usr/sbin/system_profiler || true # too slow, so output only some data types
	set -x && /usr/sbin/system_profiler SPSoftwareDataType || true
	set -x && /usr/sbin/system_profiler SPDeveloperToolsDataType || true
	set -x && /usr/sbin/system_profiler SPHardwareDataType || true
	set -x && /usr/sbin/system_profiler SPMemoryDataType || true
	set -x && /usr/sbin/system_profiler SPStorageDataType || true
	$(ECHO_DONE)


.PHONY: debug/os/linux
debug/os/linux:
	$(ECHO)
	$(ECHO_DO) "Debug OS (Linux)..."
	set -x && /usr/bin/lsb_release -a || true
	set -x && cat /etc/os-release || true
	set -x && uname -a || true
	set -x && df -h || true
	set -x && free -h || true
	$(ECHO_DONE)
