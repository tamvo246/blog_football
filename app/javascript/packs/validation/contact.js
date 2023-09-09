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
      required: "true",
      pattern: {
          value: /^\d{10}$/i,
      }
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
      required: "Vui lòng chọ khoá học",
    },
    "contact[phone]": {
      required: "Vui lòng nhập số điện thoại",
      pattern: {
          message: "Số điện thoại không hợp lệ. Vui lòng nhập 10 chữ số."
      }
    }
  }
});
