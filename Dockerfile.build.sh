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

# devex
mkdir -p "${HOME}/.config"
cp --no-clobber /sane.mk/config/starship.toml "${HOME}/.config/starship.toml"
# shellcheck disable=SC2016
cat ~/.bash_aliases | grep "startship init bash" || echo 'eval "$(starship init bash)"' >>~/.bash_aliases
