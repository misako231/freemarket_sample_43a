$(document).on('turbolinks:load', function() {
  $('.mypage__side__nav__list__item').hover(
    function(){
      $(this).css({
        'background-color':'#F9F9F9',
        // '-webkit-text-stroke':'1.8px #F2F2F2'
      });
      $(this).find('.fa').css({
        '-webkit-text-stroke':'1.8px #F9F9F9'});
    },
    function(){
      $(this).css({
        'background-color':'white',
        // '-webkit-text-stroke':'1.8px white'
      });
      $(this).find('.fa').css({'-webkit-text-stroke':'1.8px white'});
    }
  );
});
