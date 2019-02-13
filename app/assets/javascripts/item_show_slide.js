$(document).on('turbolinks:load', function() {
  $(function (){
    var image_count = $('.parent-item-container__item--main-content__item-photo__sub-containts').length

    $('.parent-item-container__item--main-content__item-photo__main ul').slick({
    autoplay: false,
    arrows: false,
    speed: 500,
    slidesToScroll: 2,
    waitForAnimate: false,
    asNavFor: '.parent-item-container__item--main-content__item-photo__sub ul'
    });
    $('.parent-item-container__item--main-content__item-photo__sub ul').slick({
      slidesToShow: image_count,
      focusOnSelect: true,
      asNavFor: '.parent-item-container__item--main-content__item-photo__main ul'
    });

    $('.parent-item-container__item--main-content__item-photo__sub ul li').on('mouseover', function(e) {
      var $currentTarget = $(e.currentTarget),
          index = $currentTarget.closest('.slick-slide').data('slick-index'),
          slickObj = $('.parent-item-container__item--main-content__item-photo__main ul').slick('getSlick');
      slickObj.slickGoTo(index, false);
    });
  });

  $('.parent-item-container__item--main-content__item-photo__sub-containts, >image').hover(
    function() {
      $(this).addClass('active');
    },
    function() {
      $(this).removeClass('active');
  });
});
