function searchShortcut() {
  const searchField = document.getElementById('search-field');
  if (searchField === null) {
    return;
  }

  document.addEventListener('keydown', (event) => {
    if (event.defaultPrevented || event.key !== 's') {
      return; // Do nothing if the event was already processed or key was not s
    }

    searchField.focus();
    event.preventDefault();
  }, true);
}

document.addEventListener('turbolinks:load', searchShortcut);
