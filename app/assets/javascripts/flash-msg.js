$(document).on('turbolinks:load', function() {
  setTimeout(function(){
    $(".delete-success-flash").fadeOut(2000);
  }, 3000);
  $(".close-btn").click(
    function(){
      $(".delete-success-flash").fadeOut("fast");
  });
});
