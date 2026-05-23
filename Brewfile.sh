#!/usr/bin/env bash
set -eEuo pipefail -o errtrace -o functrace
shopt -s inherit_errexit 2>/dev/null || true
export PS4='+(${BASH_SOURCE[0]}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
# shellcheck disable=SC2154
trap 'e=$?; set +x; s() { cmd="${BASH_COMMAND}"; >&2 echo "bash: *** [command] ${cmd}"; local i=0; while caller $i; do ((++i)); done | while read l f p; do echo "bash: *** [$p:$l $f]${e:+ Error }$e"; e=""; done; }; >&2 echo; >&2 s' ERR # editorconfig-checker-disable-line
function exe() { printf '%s\n' "$(pwd)\$ $(printf '%q ' "$@")" >&2 && "$@"; } && export -f exe
[[ -z "${VERBOSE:-${V:-}}" ]] || set -x

# shellcheck disable=SC2154
[[ ! -e "brew/zz.${HOST}.sh" ]] || source "brew/zz.${HOST}.sh"

# docker cli plugins
mkdir -p "${HOME}/.docker/cli-plugins"
[[ ! -d "$(brew --prefix)/lib/docker/cli-plugins" ]] \
    || find "$(brew --prefix)/lib/docker/cli-plugins" -mindepth 1 -maxdepth 1 | while IFS= read -r f; do
        [[ -e "${HOME}/.docker/cli-plugins/$(basename "${f}")" ]] \
        || ln -sfn "${f}" "${HOME}/.docker/cli-plugins/$(basename "${f}")"
    done
