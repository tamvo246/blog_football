import $ from 'jquery';
import 'jquery-validation';

$("#form_category").validate({
  rules: {
    "category[slug]": {
      required: true,
    },
    "category[name]": {
      required: true,
    }
  },
  messages: {
    "category[slug]": {
      required: "Vui lòng nhập liên kết",
    },
    "category[name]": {
      required: "Vui lòng nhập tên thể loại",
    }
  }
});
