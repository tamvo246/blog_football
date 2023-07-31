import $ from 'jquery';
import 'jquery-validation';

$("#form_course").validate({
  rules: {
    "course[slug]": {
      required: true,
    },
    "course[name]": {
      required: true,
    }
  },
  messages: {
    "course[slug]": {
      required: "Vui lòng nhập liên kết",
    },
    "course[name]": {
      required: "Vui lòng nhập khoá tên khoá học",
    }
  }
});
