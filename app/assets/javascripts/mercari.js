$(function(){
  console.log('hey')
  $('.slider').slick({
    autoplay: true,
    adaptiveHeight: true,
    arrows: true,
    prevArrow:'<div class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></i></div>',
    nextArrow:'<div class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></i></div>',
    dots: true,
    dotsClass: 'slide-dots'
  });
});
