tinymce.init({
  selector: '.tinymce',
  height: 500,
  plugins: [
    'image', "lists"
  ],
  toolbar: 'undo redo | formatselect | ' +
  ' bold italic | alignleft aligncenter ' +
  ' alignright alignjustify | bullist numlist outdent indent | ' +
  ' removeformat | help | forecolor backcolor image',
  image_title: true,
  automatic_uploads: true,
  images_upload_url: '/text_images',
  file_picker_types: 'image',

  document_base_url: '/',

  file_picker_callback: function(cb, value, meta) {
    var input = document.createElement('input');
    input.setAttribute('type', 'file');
    input.setAttribute('accept', 'image/*');

    input.onchange = function() {
      var file = this.files[0];

      var id = 'blobid' + (new Date()).getTime();
      var blobCache = tinymce.activeEditor.editorUpload.blobCache;
      var blobInfo = blobCache.create(id, file);
      blobCache.add(blobInfo);

      cb(blobInfo.blobUri(), { title: file.name });
    };

    input.click();
  }
});
