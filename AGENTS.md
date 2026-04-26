# sane.mk – Makefile style

## Makefile style

* **`##` is load-bearing**: comments starting with `##` (not `#`)
  feed the auto-generated `help` target. Keep them concise.
* **Target names use `/` separators**: e.g. `deps/files`, `prehook/deps`, `posthook/all`.
* **Lazy-evaluation macros**: expensive `$(shell …)` variables are deferred
  with `$(call make-lazy,VAR)` or `$(call make-lazy-once,VAR)`
  so they evaluate once (cached in `Makefile.lazy`) or once per make invocation.
* **`$(call which,NAME,gname name)`**: every external executable
  is resolved through this helper, preferring GNU-prefixed variants on macOS.
  Resulting variables are **all-caps** (e.g. `SED`, `AWK`, `DATE`).
* **Section separators**: exactly `# ---` repeated up to ~80 chars.
* **1 empty line before and after separators**
* **2 empty lines between adjacent targets**.
* **`.PHONY` on its own line** before the target definition, not inlined.
* **Dependencies go one per line**: repeat the same target once per dependency group,
  then reserve the final target line for optional help text (`## ...`).
* **EditorConfig checker pragmas**: use `# editorconfig-checker-disable-line max-line-length`
  for specific lines that exceed 120 chars. Soft limit on 80 chars, hard limit on 120 chars.
* **Shell is hard-set to bash** with `.SHELLFLAGS := -euo pipefail -o errtrace -o functrace -c`.
  Recipes assume bash, not POSIX sh.
* **Verbosity/CI switches**: `V=1` / `VERBOSE=1` / `CI=1` are globally handled in `sane.mk`.
* **`SANE_` prefix for target dependency variables**: e.g. `SANE_DEPS`, `SANE_CHECK`.
  These are collected by `target.std.inc.mk`.

## Makefile/Bash gotchas

* **Make variables are always `$(VAR)`**; **bash variables are always `$${VAR}`**
  (brackets mandatory even when skippable), and always **UPPERCASE**.
* **Command wrappers have baked-in flags**: `CP` = `cp -v -Rp`, `LN` = `ln -v -fn`,
  `MKDIR` = `mkdir -v -p`, `MV` = `mv -v -f`, `RM` = `rm -v -rf`,
  `XARGS` = `xargs --no-run-if-empty`, `CURL` = `curl -qfsSL` etc.
