const header = document.querySelector('.site-header');
const menuToggle = document.querySelector('.menu-toggle');

if (header && menuToggle) {
  menuToggle.addEventListener('click', () => {
    const isOpen = header.classList.toggle('is-menu-open');
    menuToggle.setAttribute('aria-expanded', String(isOpen));
  });
}
