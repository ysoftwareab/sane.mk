#!/usr/bin/env bash
set -eEuo pipefail -o errtrace -o functrace
shopt -s inherit_errexit 2>/dev/null || true
export PS4='+(${BASH_SOURCE[0]}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
# shellcheck disable=SC2154
trap 'e=$?; set +x; s() { local i=0; while caller $i; do ((++i)); done | while read l f p; do echo "bash: *** [$p:$l $f]${e:+ Error }$e"; e=""; done; }; >&2 echo; >&2 s' ERR # editorconfig-checker-disable-line
# shellcheck disable=SC2145,SC2294
function exe() { printf '%s\n' "$(pwd)\$ $(printf '%q ' "$@")" >&2 && "$@"; }
export -f exe
[[ -z "${VERBOSE:-${V:-}}" ]] || set -x

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Header
sed -n '1,/^# BEGIN # includes$/p' "${DIR}/sane.extended.mk"

# Inline each *.inc.mk include with BEGIN/END markers
while IFS= read -r LINE; do
  if [[ "${LINE}" =~ ^include[[:space:]]+\$\(SANE_MK_ROOT\)/([^[:space:]]+\.inc\.mk) ]]; then
    FILE="${BASH_REMATCH[1]}"
    echo
    echo "# BEGIN # ${FILE}"
    cat "${DIR}/${FILE}"
    echo "# END # ${FILE}"
  fi
done <"${DIR}/sane.extended.mk"

# Footer
sed -n '/^# END # includes$/,$p' "${DIR}/sane.extended.mk"
