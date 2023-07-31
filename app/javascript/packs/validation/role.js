import $ from 'jquery';
import 'jquery-validation';

$("#form_role").validate({
  rules: {
    "role[name]": {
      required: true,
    }
  },
  messages: {
    "role[name]": {
      required: "Vui lòng nhập tên quyền",
    }
  }
});
