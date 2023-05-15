const imageInput = document.getElementById("album_image");
const previewImg = document.getElementById("preview");

imageInput.addEventListener("change", function() {
  const file = this.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function(event) {
      previewImg.src = event.target.result;
    };
    reader.readAsDataURL(file);
    previewImg.style.display = "block";
  } else {
    previewImg.src = "#";
    previewImg.style.display = "none";
  }
});
