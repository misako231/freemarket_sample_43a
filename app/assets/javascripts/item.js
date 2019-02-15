$(document).on('turbolinks:load', function() {
  $(function () {
    $('.btn__default').click(function(){
      $("body").append('<div id="delete-overlay"></div>');
      $("#delete-overlay").fadeIn("normal");
      $('.modal').fadeIn();
    });
  });
});
