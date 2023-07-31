import $ from 'jquery';
import 'jquery-validation';

$("#form_student").validate({
  rules: {
    "student[name]": {
      required: true,
    }
  },
  messages: {
    "student[name]": {
      required: "Vui lòng nhập tên",
    }
  }
});
