#!/usr/bin/env bash

set -euo pipefail

test -f layout-rules.md
test -f index.html
test -f styles.css
test -f script.js
test -f assets/images/header-logo.webp
test -f assets/fonts/caveat-semibold.ttf

grep -q 'styles.css' index.html
grep -q 'script.js' index.html
grep -q '<header class="site-header"' index.html
grep -q -- '--color-primary' styles.css
! sed -n '/\.site-nav__link:hover,/,/^}/p' styles.css | grep -q 'background-color'
