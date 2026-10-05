const header = document.querySelector('.site-header');
const menuToggle = document.querySelector('.menu-toggle');
const mobileMenu = document.querySelector('.mobile-menu');
const menuClose = document.querySelector('.mobile-menu__close');

document.querySelectorAll('.requisite button').forEach((button) => {
  button.addEventListener('click', async () => {
    const value = button.closest('.requisite')?.dataset.copy;
    if (!value || !navigator.clipboard) {
      return;
    }

    try {
      await navigator.clipboard.writeText(value);
      button.textContent = '✓';
      window.setTimeout(() => { button.textContent = '⧉'; }, 1200);
    } catch {
      // Clipboard access can be unavailable in a local preview.
    }
  });
});

const setMenuState = (isOpen) => {
  if (!header || !menuToggle || !mobileMenu || !menuClose) {
    return;
  }

  header.classList.toggle('is-menu-open', isOpen);
  menuToggle.setAttribute('aria-expanded', String(isOpen));
  menuToggle.setAttribute('aria-label', isOpen ? 'Закрыть меню' : 'Открыть меню');
  mobileMenu.hidden = !isOpen;
  menuClose.hidden = !isOpen;
};

if (header && menuToggle && mobileMenu && menuClose) {
  menuToggle.addEventListener('click', () => {
    setMenuState(!header.classList.contains('is-menu-open'));
  });

  menuClose.addEventListener('click', () => setMenuState(false));
}

const serviceCards = document.querySelectorAll('[data-service-card]');
const servicePayments = document.querySelector('#service-payments');
const apiNeuralNetworks = document.querySelector('#api-neural-networks');
const foreignPayments = document.querySelector('#foreign-payments');
const scrollDotsUpdaters = [];

const setupScrollDots = (scrollerSelector, dotsSelector, itemSelector) => {
  const scroller = document.querySelector(scrollerSelector);
  const dots = Array.from(document.querySelectorAll(`${dotsSelector} > *`));
  const items = scroller ? Array.from(scroller.querySelectorAll(itemSelector)) : [];

  if (!scroller || !dots.length || dots.length !== items.length) {
    return;
  }

  const updateDots = () => {
    const currentIndex = items.reduce((closestIndex, item, index) => {
      const currentDistance = Math.abs(item.offsetLeft - scroller.offsetLeft - scroller.scrollLeft - 16);
      const closestDistance = Math.abs(items[closestIndex].offsetLeft - scroller.offsetLeft - scroller.scrollLeft - 16);

      return currentDistance < closestDistance ? index : closestIndex;
    }, 0);

    dots.forEach((dot, index) => {
      const isActive = index === currentIndex;
      dot.classList.toggle('is-active', isActive);
      dot.classList.toggle('is-inactive', !isActive);
    });
  };

  scroller.addEventListener('scroll', updateDots, { passive: true });
  window.addEventListener('resize', updateDots);
  scrollDotsUpdaters.push(updateDots);
  updateDots();
};

const setServicePaymentsVisibility = (activeCard) => {
  if (!servicePayments) {
    return;
  }

  servicePayments.hidden = activeCard?.dataset.serviceCard !== 'payments';
};

const setApiNeuralNetworksVisibility = (activeCard) => {
  if (!apiNeuralNetworks) {
    return;
  }

  apiNeuralNetworks.hidden = activeCard?.dataset.serviceCard !== 'api';
};

const setForeignPaymentsVisibility = (activeCard) => {
  if (!foreignPayments) {
    return;
  }

  foreignPayments.hidden = activeCard?.dataset.serviceCard !== 'foreign-payments';
};

const setActiveServiceCard = (nextCard) => {
  serviceCards.forEach((card) => {
    const isActive = card === nextCard;
    card.classList.toggle('is-active', isActive);
    card.setAttribute('aria-pressed', String(isActive));
  });

  setServicePaymentsVisibility(nextCard);
  setApiNeuralNetworksVisibility(nextCard);
  setForeignPaymentsVisibility(nextCard);
  scrollDotsUpdaters.forEach((updateDots) => updateDots());
};

const activeServiceCard = document.querySelector('[data-service-card].is-active');

setServicePaymentsVisibility(activeServiceCard);
setApiNeuralNetworksVisibility(activeServiceCard);
setForeignPaymentsVisibility(activeServiceCard);

serviceCards.forEach((card) => {
  card.addEventListener('click', (event) => {
    if (event.target.closest('.service-card__more')) {
      return;
    }

    setActiveServiceCard(card);
  });

  card.addEventListener('keydown', (event) => {
    if (event.key !== 'Enter' && event.key !== ' ') {
      return;
    }

    event.preventDefault();
    setActiveServiceCard(card);
  });
});

setupScrollDots('.services__list', '.services__dots', '.service-card');
setupScrollDots('.api-benefits', '.api-benefits__dots', '.api-benefit');
setupScrollDots('.commission-tiers', '.commission__dots', '.commission-tier');
setupScrollDots('.foreign-payments__cards', '.foreign-payments__dots', '.foreign-payment-card');
setupScrollDots('.account-choice__cards', '.account-choice__dots', '.account-choice__card');

const reviewTabs = document.querySelectorAll('[data-review-tab]');

reviewTabs.forEach((tab) => {
  tab.addEventListener('click', () => {
    reviewTabs.forEach((item) => {
      const isActive = item === tab;
      item.classList.toggle('is-active', isActive);
      item.setAttribute('aria-selected', String(isActive));
    });
  });
});

const faqTriggers = document.querySelectorAll('[data-faq-trigger]');

faqTriggers.forEach((trigger) => {
  trigger.addEventListener('click', () => {
    const nextItem = trigger.closest('.faq__item');

    faqTriggers.forEach((itemTrigger) => {
      const item = itemTrigger.closest('.faq__item');
      const answer = document.getElementById(itemTrigger.getAttribute('aria-controls'));
      const isOpen = item === nextItem && !item.classList.contains('is-open');

      item.classList.toggle('is-open', isOpen);
      itemTrigger.setAttribute('aria-expanded', String(isOpen));
      answer.hidden = !isOpen;
    });
  });
});
