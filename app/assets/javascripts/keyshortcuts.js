function searchShortcut() {
  const searchField = document.getElementById('search-field');
  if (searchField === null) {
    return;
  }

  document.addEventListener('keydown', function(event) {
    const tag = event.target.tagName;
    if (event.defaultPrevented || event.key !== 's' || tag === 'INPUT' || tag === 'TEXTAREA') {
      return; // Do nothing if the event was already processed or key was not s
    }

    searchField.focus();
    event.preventDefault();
  }, true);
}

document.addEventListener('turbolinks:load', searchShortcut);
