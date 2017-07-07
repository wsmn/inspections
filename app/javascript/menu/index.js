import menuToggle from './menu';

document.addEventListener('turbolinks:load', () => {
  menuToggle.initialize();
});
document.addEventListener('turbolinks:before-cache', () => {
  menuToggle.destroy();
});
