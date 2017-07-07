// A simple counter example
// The setup will be more complicated in modern apps built using React


const menuToggle = {
  addListener(event) {
    event.preventDefault();
    const menuNodes = document.getElementsByClassName('nav-menu');
    const menu = menuNodes[0];
    const active = menu.classList.contains('is-active');
    if (active) {
      menu.classList.remove('is-active');
    } else {
      menu.classList.add('is-active');
    }
  },
  initialize() {
    const toggleNode = document.getElementById('toggle');
    toggleNode.addEventListener('click', this.addListener);
  },
  destroy() {
    const toggleNode = document.getElementById('toggle');
    toggleNode.removeEventListener('click', this.addListener);
  },
};

export default menuToggle;
