import Pikaday from 'pikaday';
import 'pikaday/scss/pikaday.scss';

const fields = document.getElementsByClassName('datepicker');

const datepickers = {
  initialize() {
    Array.from(fields).forEach((field) => {
      const picker = new Pikaday({
        onSelect: () => {
          field.setAttribute('value', picker.toString());
        },
        i18n: {
          previousMonth: 'Föregående månad',
          nextMonth: 'Nästa månad',
          months: [
            'Januari',
            'Februari',
            'Mars',
            'April',
            'Maj',
            'Juni',
            'Juli',
            'Augusti',
            'September',
            'Oktober',
            'November',
            'December',
          ],
          weekdays: [
            'Söndag',
            'Måndag',
            'Tisdag',
            'Onsdag',
            'Torsdag',
            'Fredag',
            'Lördag',
          ],
          weekdaysShort: [
            'Sön',
            'Mån',
            'Tis',
            'Ons',
            'Tor',
            'Fre',
            'Lör',
          ],
        },
        firstDay: 1,
      });
      field.parentNode.insertBefore(picker.el, field.nextSibling);
    });
  },
};

export default datepickers;
