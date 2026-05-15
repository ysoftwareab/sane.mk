#!/usr/bin/env bash
set -eEuo pipefail -o errtrace -o functrace
shopt -s inherit_errexit 2>/dev/null || true
export PS4='+(${BASH_SOURCE[0]}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
# shellcheck disable=SC2154
trap 'e=$?; set +x; s() { cmd="${BASH_COMMAND}"; >&2 echo "bash: *** [command] ${cmd}"; local i=0; while caller $i; do ((++i)); done | while read l f p; do echo "bash: *** [$p:$l $f]${e:+ Error }$e"; e=""; done; }; >&2 echo; >&2 s' ERR # editorconfig-checker-disable-line
function exe() { printf '%s\n' "$(pwd)\$ $(printf '%q ' "$@")" >&2 && "$@"; } && export -f exe
[[ -z "${VERBOSE:-${V:-}}" ]] || set -x

GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
GITHUB_GITIGNORE_COMMITISH=5b0261b4675e803934284a1c37eb478c38a89030
GITHUB_GITIGNORE_BASE_URL="https://raw.githubusercontent.com/github/gitignore/${GITHUB_GITIGNORE_COMMITISH}" # editorconfig-checker-disable-line

# Removing the Emacs gitignore template because it's overly agressive,
# ignoring things like  all "server" or "dist" folders.
GITHUB_GITIGNORES="\
    Global/Backup \
    Global/Linux \
    Global/Patch \
    Global/Vim \
    Global/VisualStudioCode \
    Global/Windows \
    Global/macOS \
"

LOCAL_GITIGNORES="\
"

mkdir -p "${GIT_ROOT}/gitconfig/github-global-gitignore"
for GITHUB_GITIGNORE in ${GITHUB_GITIGNORES}; do
    curl -qfsSL -o "${GIT_ROOT}/gitconfig/github-global-gitignore/${GITHUB_GITIGNORE//\//-}.gitignore" \
        "${GITHUB_GITIGNORE_BASE_URL}/${GITHUB_GITIGNORE}.gitignore"
done

echo "# -*- mode: Gitignore -*-"

echo
echo "# BEGIN gitconfig/dot.gitignore_global.base"
echo
cat "${GIT_ROOT}/gitconfig/dot.gitignore_global.base"
echo
echo "# END gitconfig/dot.gitignore_global.base"

for GITHUB_GITIGNORE in ${GITHUB_GITIGNORES}; do
    echo
    echo "################################################################################"
    echo
    echo "# BEGIN ${GITHUB_GITIGNORE_BASE_URL}/${GITHUB_GITIGNORE//\//-}.gitignore"
    echo
    cat "${GIT_ROOT}/gitconfig/github-global-gitignore/${GITHUB_GITIGNORE//\//-}.gitignore"
    echo
    echo "# END ${GITHUB_GITIGNORE_BASE_URL}/${GITHUB_GITIGNORE//\//-}.gitignore"
done

for LOCAL_GITIGNORE in ${LOCAL_GITIGNORES}; do
    echo
    echo "# BEGIN ${LOCAL_GITIGNORE}"
    echo
    cat "${LOCAL_GITIGNORE}"
    echo
    echo "# END ${LOCAL_GITIGNORE}"
done
