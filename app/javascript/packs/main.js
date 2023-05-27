$(document).ready(function () {
  var toggleMenu = $(
      ".header-main .main-navigation .box-wrapper .toggle-menu"
  );
  var topMenu = $("#top-menu");
  toggleMenu.click(function () {
      topMenu.toggleClass("active");
  });
  // -----Popup Gallery Image-----//
  $('.image-popup').magnificPopup({
      type: 'image',
      gallery: {
          enabled: true
      },
  });
  // -----Popup Video-----//
  $('.video-popup').magnificPopup({
      type: 'iframe'
  });
});
