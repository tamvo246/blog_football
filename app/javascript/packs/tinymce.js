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
  // Enable title field in the Image dialog
  image_title: true,
  // Enable automatic uploads of images represented by blob or data URIs
  automatic_uploads: true,
  // URL of your upload handler
  // (YOU SHOULD MAKE AN ENDPOINT TO RECEIVE THIS AND RETURN A JSON CONTAINING: {location: remote_image_url})
  images_upload_url: '/text_images',
  // Here we add custom filepicker only to Image dialog
  file_picker_types: 'image',

  document_base_url: '/',
  // And here's your custom image picker
  file_picker_callback: function(cb, value, meta) {
    var input = document.createElement('input');
    input.setAttribute('type', 'file');
    input.setAttribute('accept', 'image/*');

    input.onchange = function() {
      var file = this.files[0];

      // Note: Now we need to register the blob in TinyMCEs image blob
      // registry.
      var id = 'blobid' + (new Date()).getTime();
      var blobCache = tinymce.activeEditor.editorUpload.blobCache;
      var blobInfo = blobCache.create(id, file);
      blobCache.add(blobInfo);

      // Call the callback and populate the Title field with the file name
      cb(blobInfo.blobUri(), { title: file.name });
    };

    input.click();
  },
  color_map: [
    '#BFEDD2', 'Light Green',
    '#FBEEB8', 'Light Yellow',
    '#F8CAC6', 'Light Red',
    '#ECCAFA', 'Light Purple',
    '#C2E0F4', 'Light Blue',

    '#2DC26B', 'Green',
    '#F1C40F', 'Yellow',
    '#E03E2D', 'Red',
    '#B96AD9', 'Purple',
    '#3598DB', 'Blue',

    '#169179', 'Dark Turquoise',
    '#E67E23', 'Orange',
    '#BA372A', 'Dark Red',
    '#843FA1', 'Dark Purple',
    '#236FA1', 'Dark Blue',

    '#ECF0F1', 'Light Gray',
    '#CED4D9', 'Medium Gray',
    '#95A5A6', 'Gray',
    '#7E8C8D', 'Dark Gray',
    '#34495E', 'Navy Blue',

    '#000000', 'Black',
    '#ffffff', 'White'
  ]
});

// tinymce.init({
//   selector: '.tinymce',
//   height: 500,
//   // Include image plugin on plugin list
//   plugins: [ 'image'],
//   // Include image button on toolbar
//   toolbar: ['image'],
//   // Enable title field in the Image dialog
//   image_title: true,
//   // Enable automatic uploads of images represented by blob or data URIs
//   automatic_uploads: true,
//   // URL of your upload handler
//   // (YOU SHOULD MAKE AN ENDPOINT TO RECEIVE THIS AND RETURN A JSON CONTAINING: {location: remote_image_url})
//   images_upload_url: '/text_images',
//   // Here we add custom filepicker only to Image dialog
//   file_picker_types: 'image',
//   // And here's your custom image picker
//   file_picker_callback: function(cb, value, meta) {
//     var input = document.createElement('input');
//     input.setAttribute('type', 'file');
//     input.setAttribute('accept', 'image/*');

//     input.onchange = function() {
//       var file = this.files[0];

//       // Note: Now we need to register the blob in TinyMCEs image blob
//       // registry.
//       var id = 'blobid' + (new Date()).getTime();
//       var blobCache = tinymce.activeEditor.editorUpload.blobCache;
//       var blobInfo = blobCache.create(id, file);
//       blobCache.add(blobInfo);

//       // Call the callback and populate the Title field with the file name
//       cb(blobInfo.blobUri(), { title: file.name });
//     };

//     input.click();
//   }
// });
