$(document).on('turbolinks:load', function() {
  $(function () {
  $('.btn__default').click(function(){
    $('.modal').fadeIN();
    $(this).prop("disabled", false);
  });
});
