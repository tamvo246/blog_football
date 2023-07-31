import $ from 'jquery';
import 'jquery-validation';

$("#form_coach").validate({
  rules: {
    "coach[email]": {
      required: true,
      email: true
    },
    "coach[name]": {
      required: true,
    },
    "coach[phone]":{
      required: true,
    },
   "coach[course_ids][]":{
      required: true,
   }

  },
  messages: {
    "coach[name]": {
      required: "Vui lòng nhập tên",
    },
    "coach[email]": {
      required: "Vui lòng nhập email ",
      email: "Vui lòng nhập địa chỉ email hợp lệ."
    },
    "coach[phone]":{
      required: "Vui lòng nhập số điện thoại",
    },
    "coach[course_ids][]":{
      required: "Vui lòng chọn khoá học", 
   }
  }
});
