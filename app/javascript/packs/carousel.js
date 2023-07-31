document.addEventListener('turbolinks:load', function() {
  $('.slider-coach, .slider-student').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    navText: [
        '<i class="fas fa-chevron-left"></i>',
        '<i class="fas fa-chevron-right"></i>',
    ],
    autoplay: true,
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 3
        },
        1000: {
            items: 4
        }
    }
  })
})

$(document).ready(function() {
  $('.slider-coach, .slider-student').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    navText: [
        '<i class="fas fa-chevron-left"></i>',
        '<i class="fas fa-chevron-right"></i>',
    ],
    autoplay: true,
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 3
        },
        1000: {
            items: 4
        }
    }
  })
});
