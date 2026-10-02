#!/usr/bin/env bash

set -euo pipefail

test -f layout-rules.md
test -f index.html
test -f styles.css
test -f script.js
test -f assets/images/header-logo.webp
test -f assets/fonts/caveat-semibold.ttf
test -f assets/fonts/8fb415819784353d.woff
test -f assets/fonts/fe151a33b3b076d1.woff
test -f assets/fonts/inter.ttf
test -f assets/fonts/montserrat.ttf
test -f assets/fonts/roboto-mono.ttf

grep -q 'styles.css' index.html
grep -q 'script.js' index.html
grep -q '<header class="site-header"' index.html
grep -q -- '--color-primary' styles.css
! sed -n '/\.site-nav__link:hover,/,/^}/p' styles.css | grep -q 'background-color'
grep -q 'font-family: Inter' styles.css
grep -q 'font-family: Montserrat' styles.css
grep -q 'font-family: "Roboto Mono"' styles.css
grep -q 'font-family: rugon' styles.css
grep -q 'aria-expanded="false"' index.html
test -f assets/fonts/futura-pt-medium.ttf
grep -q 'assets/fonts/futura-pt-medium.ttf' styles.css
test -f assets/fonts/futura-pt-demi-oblique.ttf
grep -q 'assets/fonts/futura-pt-demi-oblique.ttf' styles.css
test -f assets/fonts/futura-pt-light.ttf
test -f assets/fonts/futura-pt-demi.ttf
test -f assets/fonts/futura-pt-bold.ttf
test -f assets/fonts/futura-pt-heavy.ttf
grep -q 'assets/fonts/futura-pt-demi.ttf' styles.css
sed -n '/\.brand__logo {/,/^}/p' styles.css | grep -q 'height: 61px'
sed -n '/\.site-header__content {/,/^}/p' styles.css | grep -q 'margin-left: auto'
sed -n '/\.site-nav {/,/^}/p' styles.css | grep -q 'gap: 6px'
sed -n '/\.button {/,/^}/p' styles.css | grep -q 'justify-content: flex-start'
grep -q 'aria-controls="mobile-menu"' index.html
grep -q 'id="mobile-menu"' index.html
grep -q 'Оплата сервисов' index.html
grep -q '8 (800) 200-79-65' index.html
grep -q 'mobile-menu__close' index.html
grep -q "classList.toggle('is-menu-open'" script.js
grep -q '.site-header.is-menu-open .mobile-menu' styles.css
grep -q '.site-header.is-menu-open .menu-toggle' styles.css
grep -q 'width: 64%' styles.css
grep -q '.site-header.is-menu-open {' styles.css
sed -n '/\.site-header\.is-menu-open {/,/^  }/p' styles.css | grep -q 'background: transparent'
sed -n '/\.mobile-menu__link {/,/^  }/p' styles.css | grep -q 'font-size: 16px'
sed -n '/\.mobile-menu__link {/,/^  }/p' styles.css | grep -q 'white-space: nowrap'
sed -n '/\.mobile-menu__plus {/,/^  }/p' styles.css | grep -q 'font-weight: 700'
