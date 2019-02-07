$(document).on('turbolinks:load', function() {
  $('.search-nav__list, search-nav__list__title, .header-nav__parent__wrap, li').hover(
    function() {
      $('>ul >li', this).show();
    },
    function() {
      $('>ul >li', this).hide();
  });

  $('.header-nav__child__wrap, .header-nav__grandchild__wrap').hover(
    function() {
      $(this).prev('h3').children('a').addClass('active')
      $(this).prev('a').addClass('active')
    },
    function() {
      $(this).prev('h3').children('a').removeClass('active')
      $(this).prev('a').removeClass('active')
    });

  $('.header-nav__parent').hover(
    function() {
      $('.header-nav__parent__wrap').css('width','448px');
    },
    function() {
      $('.header-nav__parent__wrap').css('width','auto');
  });

  $('.header-nav__child__wrap, .header-nav__grandchild__wrap').hover(
    function() {
      $('.header-nav__parent__wrap').css('width','768px');
    },
    function() {
      $('.header-nav__parent__wrap').css('width','auto');
  });
});
