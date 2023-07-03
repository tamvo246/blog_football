const imageInput = document.getElementById("coach_image");
const previewImg = document.getElementById("preview_coach");

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
