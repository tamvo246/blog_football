import $ from 'jquery';
import 'jquery-validation';

$("#form_post").validate({
  rules: {
    "post[slug]": {
      required: true,
    },
    "post[title]": {
      required: true,
    }
  },
  messages: {
    "post[slug]": {
      required: "Vui lòng nhập liên kết",
    },
    "post[title]": {
      required: "Vui lòng nhập tiêu đề",
    }
  }
});
