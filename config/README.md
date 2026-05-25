# config

## .markdownlint.jsonc

Follow [Google style](https://google.github.io/styleguide/docguide/style.html), with some adjustments:

* max line length of 120 characters (instead of 80)
* allow inline HTML
* allow bare URLs
* list spacing/indentation of 1, instead of 4-column

## .shellcheckrc

Follow [Google style](https://google.github.io/styleguide/shellguide.html), with some adjustments:

* allow for declaration and assignment in the same line (SC2155)
* allow for cd without checking for failure given strict bash style (SC2164)
* allow non-builtin expansion over external tools (SC2001)
* allow for $(()) style arithmetic expansion, preferred for clarity (SC2004)
