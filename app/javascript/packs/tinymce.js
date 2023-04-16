tinymce.init({
  selector: '.tinymce',
  height: 500,
  menubar: false,
  plugins: [
    'advlist autolink lists link image charmap print preview anchor',
    'searchreplace visualblocks code fullscreen',
    'insertdatetime media table paste code help'
  ],
  toolbar: 'undo redo | formatselect | ' +
  ' bold italic backcolor | alignleft aligncenter ' +
  ' alignright alignjustify | bullist numlist outdent indent | ' +
  ' removeformat | help | forecolor backcolor image',
  paste_block_drop: false,
  paste_data_images: true,
  paste_as_text: true,
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
