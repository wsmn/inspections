// A simple counter example
// The setup will be more complicated in modern apps built using React

const notificationNodes = document.getElementsByClassName('notification');

const notificationHide = {
  initialize() {
    Array.from(notificationNodes).forEach((node) => {
      const button = node.getElementsByClassName('delete')[0];
      button.addEventListener('click', () => {
        node.style.display = 'none';
      });
    });
  },
};

export default notificationHide;
