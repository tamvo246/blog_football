import $ from 'jquery';
import 'jquery-validation';

$("#form_contact").validate({
  rules: {
    "contact[email]": {
      required: true,
      email: true
    },
    "contact[full_name]": {
      required: true,
    },
    "contact[content]":{
      required: true,
    }
  },
  messages: {
    "contact[full_name]": {
      required: "Vui lòng nhập tên",
    },
    "contact[email]": {
      required: "Vui lòng nhập email ",
      email: "Vui lòng nhập địa chỉ email hợp lệ."
    },
    "contact[content]":{
      required: "Vui lòng nhập nội dung",
    }
  }
});
