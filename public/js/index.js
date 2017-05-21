$(document).ready(function () {

    $('.back-to-top').click(() => {
        $("html, body").animate({ scrollTop: 0 }, 500);
        return false;
    })
    $('.carousel').carousel({
        interval: false
    });

    // $('.carousel1').carousel({
    //   interval: 2000
    // })

    $(".menu-button").click(function () {
        $(".main-menu-box").toggleClass("main-menu-box-move");
    });

    $(".contact-box-button").click(function () {
        $(".contact-box").toggleClass("contact-box-up");
    });

    $(".contact-box-button").click(function () {
        $(".contact-box-title").toggleClass("block");
    });

    $(".loggoff-button").click(function () {
        $(".log-in").toggleClass("appear");
    });

    $(".online-payment-input").click(function () {
        $(".online-payment-content").toggleClass("appear");
    });
    $(".online-payment-label").click(function () {
        $(".online-payment-content").toggleClass("appear");
    });

    $(".remove > div").click(function() {
        $(this).parents("td").parents("tr").remove();
        changed();
    });

    $(".logged").click(function () {
        $(".logged-box").toggleClass("appear");
    });
    $(".log-in").click(function () {
        $(".log-in-box").toggleClass("appear");
    });

    $(".usn").click(function () {
        $(".usn-box").toggleClass("appear");
    });
    $(".dkdn").click(function () {
        $(".dkdn-box").toggleClass("appear");
    });

    $(".buy").click(function () {
        $(".buy").css("display", "none");
        $(".added").css("display", "block");
    });

    $(".watch-more").click(function () {
        $(".cau-hinh-don-gian").css("display", "none");
        $(".watch-more").css("display", "none");
        $(".cau-hinh-chi-tiet").css("display", "block");
        $(".close-button").css("display", "block");
    });

    $(".close-button").click(function () {
        $(".cau-hinh-don-gian").css("display", "block");
        $(".watch-more").css("display", "block");
        $(".cau-hinh-chi-tiet").css("display", "none");
        $(".close-button").css("display", "none");

    });

    $(".sap-xep-title").click(function () {
        $(".sap-xep").toggleClass("height-auto");
    });
    $(".nhan-hieu-title").click(function () {
        $(".nhan-hieu").toggleClass("height-auto");
    });
    $(".gia-tien-title").click(function () {
        $(".gia-tien").toggleClass("height-auto");
    });
    $(".loai-dien-thoai-title").click(function () {
        $(".loai-dien-thoai").toggleClass("height-auto");
    });

    $(".the-loai-title").click(function () {
        $(".the-loai").toggleClass("height-auto");
    });
    $(".thoi-gian-title").click(function () {
        $(".thoi-gian").toggleClass("height-auto");
    });

    $('.onclick-loggoff').on('click', function () {
        $('.log-in').css('display', 'block', '!important');
        $('.logged').css('display', 'none', '!important');
    });

    $('.modal').on('show.bs.modal', function (e) {

        $('body').addClass('test');
    })

});

$(window).scroll(function () {
    var scrollY = $(document).scrollTop();
    var searchBarHeight = $('.search-bar').height();
    var mainMenuBarHeight = $('.main-menu-bar').height();
    if ($(window).width() > 768) {
        if (scrollY > searchBarHeight) {
            $('.search-bar').hide();
            $('.main-menu-bar').animate({ top: '0px' }, 0);
        } else {
            $('.main-menu-bar').animate({ top: searchBarHeight + 'px' }, 0);
            $('.search-bar').show();
        }
    }
});

