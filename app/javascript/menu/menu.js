// A simple counter example
// The setup will be more complicated in modern apps built using React

const toggleNode = document.getElementById('toggle');
const menuNodes = document.getElementsByClassName('nav-menu');

const menuToggle = {
  initialize() {
    toggleNode.addEventListener('click', (event) => {
      event.preventDefault();
      const menu = menuNodes[0];
      const active = menu.classList.contains('is-active');
      if (active) {
        menu.classList.remove('is-active');
      } else {
        menu.classList.add('is-active');
      }
    });
  },
};

export default menuToggle;
