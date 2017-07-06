function searchKeydown(event) {
  const tag = event.target.tagName;
  const searchField = document.getElementById('search-field');
  if (searchField === null || event.defaultPrevented ||
      event.key !== 's' || tag === 'INPUT' || tag === 'TEXTAREA') {
    return; // Do nothing if the event was already processed or key was not s
  }

  searchField.focus();
  event.preventDefault();
}

function setupShortcuts() {
  document.addEventListener('keydown', searchKeydown, true);
}

function removeShortcuts() {
  document.removeEventListener('keydown', searchKeydown, true);
}

document.addEventListener('turbolinks:load', setupShortcuts);
document.addEventListener('turbolinks:before-cache', removeShortcuts);
