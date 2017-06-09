// A simple counter example
// The setup will be more complicated in modern apps built using React

const notificationNodes = document.getElementsByClassName('notification');

const notification_hide = {
  initialize() {
    for (let node of notificationNodes) {
      const button = node.getElementsByClassName('delete')[0];
      button.addEventListener('click', (event) => {
        node.style.display = 'none';
      });
    }
  }
};

export default notification_hide;
