import $ from 'jquery';
import 'jquery-validation';

$("#new_user").validate({
  rules: {
    "user[email]": {
      required: true,
      email: true
    },
    "user[password]": {
      required: true,
      min: 8
    }
  },
  messages: {
    "user[password]": {
      required: "Vui lòng nhập password",
      min: "Mật khẩu ít nhất 8 kí tự",
    },
    "user[email]": {
      required: "Vui lòng nhập email ",
      email: "Vui lòng nhập địa chỉ email hợp lệ."
    }
  }
});
