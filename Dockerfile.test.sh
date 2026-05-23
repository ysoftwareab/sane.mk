#!/usr/bin/env bash
# -*- mode: bash -*-
set -euo pipefail

V=1 make -C /sane.mk test/system/brewfile
