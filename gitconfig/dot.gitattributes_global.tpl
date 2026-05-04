#!/usr/bin/env bash
set -eEuo pipefail -o errtrace -o functrace
shopt -s inherit_errexit 2>/dev/null || true
export PS4='+(${BASH_SOURCE[0]}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
# shellcheck disable=SC2154
trap 'e=$?; set +x; s() { local i=0; while caller $i; do ((++i)); done | while read l f p; do echo "bash: *** [$p:$l $f]${e:+ Error }$e"; e=""; done; }; >&2 echo; >&2 s' ERR # editorconfig-checker-disable-line
function exe() { printf '%s\n' "$(pwd)\$ $(printf '%q ' "$@")" >&2 && "$@"; } && export -f exe
[[ -z "${VERBOSE:-${V:-}}" ]] || set -x

GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
GITHUB_GLOBAL_GITATTRIBUTES_COMMITISH=fddc586cf0f10ec4485028d0d2dd6f73197a4258
GITHUB_GLOBAL_GITATTRIBUTES_BASE_URL="https://raw.githubusercontent.com/gitattributes/gitattributes/${GITHUB_GLOBAL_GITATTRIBUTES_COMMITISH}" # editorconfig-checker-disable-line

# Removing the Emacs gitignore template because it's overly agressive,
# ignoring things like  all "server" or "dist" folders.
GITHUB_GLOBAL_GITATTRIBUTESS="\
    Global/VisualStudioCode \
    Common \
    Markdown \
    Python \
"

LOCAL_GITIGNORES="\
"

mkdir -p "${GIT_ROOT}/gitconfig/github-global-gitattributes"
for GITHUB_GLOBAL_GITATTRIBUTES in ${GITHUB_GLOBAL_GITATTRIBUTESS}; do
    curl -qfsSL -o "${GIT_ROOT}/gitconfig/github-global-gitattributes/${GITHUB_GLOBAL_GITATTRIBUTES}.gitattributes" \
        "${GITHUB_GLOBAL_GITATTRIBUTES_BASE_URL}/${GITHUB_GLOBAL_GITATTRIBUTES}.gitattributes"
done

echo "# -*- mode: Gitattributes -*-"

echo
echo "# BEGIN gitconfig/dot.gitattributes_global.base"
echo
cat "${GIT_ROOT}/gitconfig/dot.gitattributes_global.base"
echo
echo "# END gitconfig/dot.gitattributes_global.base"

for GITHUB_GLOBAL_GITATTRIBUTES in ${GITHUB_GLOBAL_GITATTRIBUTESS}; do
    echo
    echo "################################################################################"
    echo
    echo "# BEGIN ${GITHUB_GLOBAL_GITATTRIBUTES_BASE_URL}/${GITHUB_GLOBAL_GITATTRIBUTES}.gitattributes"
    echo
    cat "${GIT_ROOT}/gitconfig/github-global-gitattributes/${GITHUB_GLOBAL_GITATTRIBUTES}.gitattributes"
    echo
    echo "# END ${GITHUB_GLOBAL_GITATTRIBUTES_BASE_URL}/${GITHUB_GLOBAL_GITATTRIBUTES}.gitattributes"
done

for LOCAL_GITIGNORE in ${LOCAL_GITIGNORES}; do
    echo
    echo "# BEGIN ${LOCAL_GITIGNORE}"
    echo
    cat "${LOCAL_GITIGNORE}"
    echo
    echo "# END ${LOCAL_GITIGNORE}"
done
