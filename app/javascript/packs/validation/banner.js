import $ from 'jquery';
import 'jquery-validation';

$("#form_banner").validate({
  rules: {
    "banner[image]": {
      required: true,
    }
  },
  messages: {
    "banner[image]": {
      required: "Vui lòng chọn ảnh",
    }
  }
});
