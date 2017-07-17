// A simple counter example
// The setup will be more complicated in modern apps built using React


const menuToggle = {
  addListener(event) {
    event.preventDefault();
    const menuNodes = document.getElementsByClassName('navbar-menu');
    const menu = menuNodes[0];
    const active = menu.classList.contains('is-active');
    if (active) {
      menu.classList.remove('is-active');
    } else {
      menu.classList.add('is-active');
    }
  },
  initialize() {
    const burgerNode = document.getElementsByClassName('navbar-burger')[0];
    burgerNode.addEventListener('click', this.addListener);
  },
  destroy() {
    const burgerNode = document.getElementsByClassName('navbar-burger')[0];
    burgerNode.removeEventListener('click', this.addListener);
  },
};

export default menuToggle;
