const header = document.querySelector('.site-header');
const menuToggle = document.querySelector('.menu-toggle');
const mobileMenu = document.querySelector('.mobile-menu');
const menuClose = document.querySelector('.mobile-menu__close');

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

const setActiveServiceCard = (nextCard) => {
  serviceCards.forEach((card) => {
    const isActive = card === nextCard;
    card.classList.toggle('is-active', isActive);
    card.setAttribute('aria-pressed', String(isActive));
  });

  setServicePaymentsVisibility(nextCard);
  setApiNeuralNetworksVisibility(nextCard);
};

const activeServiceCard = document.querySelector('[data-service-card].is-active');

setServicePaymentsVisibility(activeServiceCard);
setApiNeuralNetworksVisibility(activeServiceCard);

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
