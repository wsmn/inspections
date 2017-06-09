import Pikaday from 'pikaday';
import 'pikaday/scss/pikaday.scss';

const fields = document.getElementsByClassName('datepicker');

const datepickers = {
  initialize() {
    for (let field of fields) {
      const picker = new Pikaday({
        onSelect: (_) => {
          field.value = picker.toString();
        },
        i18n: {
          previousMonth: 'Föregående månad',
          nextMonth: 'Nästa månad',
          months: ['Januari','Februari','Mars','April','Maj','Juni','Juli','Augusti','September','Oktober','November','December'],
          weekdays: ['Söndag','Måndag','Tisdag','Onsdag','Torsdag','Fredag','Lördag'],
          weekdaysShort: ['Sön','Mån','Tis','Ons','Tor','Fre','Lör'],
        },
        firstDay: 1
      });
      field.parentNode.insertBefore(picker.el, field.nextSibling);
    }
  }
};

export default datepickers;
