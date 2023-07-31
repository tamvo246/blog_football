import $ from 'jquery';
import 'jquery-validation';

$("#form_about").validate({
  rules: {
    "about[slug]": {
      required: true,
    }
  },
  messages: {
    "about[slug]": {
      required: "Vui lòng nhập liên kết",
    }
  }
});
