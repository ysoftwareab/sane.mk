#!/usr/bin/env bash
# -*- mode: bash -*-
set -euo pipefail
set -x

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true
sudo apt-get -y --fix-missing --allow-releaseinfo-change update
brew update
brew upgrade

rm -f /sane.mk/Makefile.lazy
V=1 make -C /sane.mk system/brewfile
rm -f /sane.mk/Makefile.lazy
make -C /sane.mk help

# clean
# FIXME can't get /tmp mounted as a docker cache. Permission issues
sudo rm -rf /tmp/{*,.[^.]*} || true
