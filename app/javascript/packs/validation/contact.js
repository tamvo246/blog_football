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
    },
    "contact[course_id]":{
      required: true,
    },
    "contact[phone]": {
      digits: true,       // Ensure it contains only digits
      customphoneformat: true  // Custom rule for starting with "0"
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
    ,
    "contact[course_id]":{
      required: "Vui lòng chọn khoá học",
    },
    "contact[phone]": {
      digits: "Số điện thoại chỉ được chứa các chữ số",
      customphoneformat: "Số điện thoại phải bắt đầu bằng số 0 và có 10 chữ số"
    }
  }
});

jQuery.validator.addMethod('customphoneformat', function (value) {
  var regex = /^0\d{9}$/;
  return value.match(regex);
});
