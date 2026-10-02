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
sed -n '/font-family: Montserrat;/,/^}/p' styles.css | grep -q 'font-weight: 100 900'
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
sed -n '/\.site-nav {/,/^}/p' styles.css | grep -q 'gap: 20px'
sed -n '/\.button {/,/^}/p' styles.css | grep -q 'justify-content: flex-start'
grep -q 'aria-controls="mobile-menu"' index.html
grep -q 'id="mobile-menu"' index.html
grep -q 'Оплата сервисов' index.html
grep -q '8 (800) 200-79-65' index.html
grep -q 'mobile-menu__close' index.html
grep -q 'class="hero"' index.html
grep -q 'Зарубежные сервисы' index.html
grep -q 'и платежи для вашего бизнеса' index.html
grep -q 'class="hero__benefits"' index.html
grep -q 'class="hero__cta"' index.html
grep -q "classList.toggle('is-menu-open'" script.js
grep -q '.site-header.is-menu-open .mobile-menu' styles.css
grep -q '.site-header.is-menu-open .menu-toggle' styles.css
grep -q 'width: 64%' styles.css
grep -q '.site-header.is-menu-open {' styles.css
sed -n '/\.site-header\.is-menu-open {/,/^  }/p' styles.css | grep -q 'background: transparent'
sed -n '/\.mobile-menu__link {/,/^  }/p' styles.css | grep -q 'font-size: 16px'
sed -n '/\.mobile-menu__link {/,/^  }/p' styles.css | grep -q 'white-space: nowrap'
sed -n '/\.mobile-menu__plus {/,/^  }/p' styles.css | grep -q 'font-weight: 700'
grep -q '^\.hero {' styles.css
grep -q '^  \.hero {' styles.css
sed -n '/\.hero__benefits {/,/^}/p' styles.css | grep -q 'gap: 12px 0px'
if sed -n '/^  \.hero__benefit {/,/^  }/p' styles.css | grep -q 'min-height'; then exit 1; fi
sed -n '/\.hero__operator {/,/^}/p' styles.css | grep -q 'padding: 11px 31px'
sed -n '/\.hero__operator {/,/^}/p' styles.css | grep -q 'font-size: 18px'
sed -n '/\.hero__operator {/,/^}/p' styles.css | grep -q 'font-family: "Futura PT Book"'
sed -n '/\.button--primary {/,/^}/p' styles.css | grep -q 'font-family: "Futura PT Book"'
grep -q '^\.hero__operator:hover' styles.css
grep -q '^\.hero__email:hover' styles.css
grep -q '<section class="services"' index.html
grep -q 'data-service-card' index.html
grep -q 'Оплата зарубежных сервисов' index.html
grep -q 'API нейросетей по безналу' index.html
grep -q 'Зарубежные платежи' index.html
grep -q 'service-card__more' index.html
grep -q 'class="services__dots"' index.html
grep -q 'M12 5v14M6 13l6 6 6-6' index.html
grep -q "classList.toggle('is-active'" script.js
grep -q 'setupScrollDots' script.js
grep -q '^\.service-card.is-active' styles.css
grep -q '^\.services__dots' styles.css
sed -n '/^\.service-card.is-active {/,/^}/p' styles.css | grep -q 'box-shadow: 0 6px 18px rgb(163 42 141 / 10%)'
grep -q 'id="service-payments"' index.html
grep -q 'Зарубежные сервисы и подписки' index.html
grep -q 'Комиссия снижается с ежемесячным объёмом' index.html
grep -q 'class="service-steps"' index.html
grep -q 'class="commission-tiers"' index.html
grep -q 'setServicePaymentsVisibility' script.js
grep -q '^\.service-payments {' styles.css
grep -q 'id="api-neural-networks"' index.html
grep -q 'Все современные модели' index.html
grep -q 'class="api-benefits"' index.html
grep -q 'class="api-steps"' index.html
grep -q 'setApiNeuralNetworksVisibility' script.js
grep -q '^\.api-neural-networks {' styles.css
grep -q 'id="foreign-payments"' index.html
grep -q 'Платежи с зарубежными контрагентами' index.html
grep -q 'class="foreign-payments__cards"' index.html
grep -q 'class="foreign-payments__cards-group"' index.html
grep -q 'setForeignPaymentsVisibility' script.js
grep -q '^\.foreign-payments {' styles.css
grep -q '^\.foreign-payments__cards-group {' styles.css
grep -q 'class="api-benefits-group"' index.html
grep -q '^\.api-benefits-group {' styles.css
