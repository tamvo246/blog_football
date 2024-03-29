document.addEventListener('turbolinks:load', function() {
    $(window).scroll(function () {
        var scroll = $(this);
        $("#site-header").toggleClass(
            "sticky slideInDown animated",
            scroll[0].pageYOffset > 0
        );
    });

    var toggleMenu = $(
        ".header-main .main-navigation .box-wrapper .toggle-menu"
    );
    var topMenu = $("#top-menu");
    toggleMenu.click(function () {
        $(this).find("i").toggleClass("fa-x fa-bars");
        topMenu.toggleClass("active");

    });
    $("#top-menu .btn-arrow").click(function () {
        $(this).next().toggle();
    });

    var galleryPopup = $('.gallery-popup');
    galleryPopup.magnificPopup({
        type: 'image',
        gallery: {
            enabled: true
        }
    });

    //   -----Popup Gallery Image-----//
    $('.image-popup').magnificPopup({
        type: 'image',
        gallery: {
            enabled: true
        },
    });

    //   // -----Popup Video-----//
    $('.video-popup').magnificPopup({
        type: 'iframe'
    });

    $('.slider-about').owlCarousel({
        loop: true,
        margin: 10,
        nav: false,
        items: 1,
        dots: true,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true
    });

    $('.slider-banner-home').owlCarousel({
        loop: true,
        margin: 0,
        autoplay: true,
        nav: true,
        navText: [
            '<i class="fas fa-chevron-left"></i>',
            '<i class="fas fa-chevron-right"></i>',
        ],
        items: 1,
        dots: false,
        autoplayTimeout: 3000,
        autoplayHoverPause: true
    });
});
