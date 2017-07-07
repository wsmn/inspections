import notificationHide from './notifications';

document.addEventListener('turbolinks:load', () => {
  notificationHide.initialize();
});
