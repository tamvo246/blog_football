$(document).ready(function () {
  $('#sidebarCollapse').on('click', function () {
      $('#sidebar').toggleClass('active');
  });

  const titleInput = document.getElementById('name-input');
  const slugInput = document.getElementById('slug-input');

  // Add an event listener to the title input for the "input" event
  titleInput.addEventListener('input', function() {
    const titleValue = titleInput.value;
    const valueChange = titleValue.normalize("NFD").replace(/[\u0300-\u036f]/g, "")
    const slugValue = slugify(valueChange);
    slugInput.value = slugValue;
  });

  function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .replace("đ", "d")
}
});
