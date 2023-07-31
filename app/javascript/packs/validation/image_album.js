import $ from 'jquery';
import 'jquery-validation';

$("#form_album_image").validate({
  rules: {
    "album_image[image]": {
      required: true,
    }
  },
  messages: {
    "album_image[image]": {
      required: "Vui lòng chọn hình ảnh",
    }
  }
});
