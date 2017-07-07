import datepickers from './datepicker';

document.addEventListener('turbolinks:load', () => {
  datepickers.initialize();
});
