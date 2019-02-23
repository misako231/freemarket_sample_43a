$(document).on('turbolinks:load', function() {
  $(".parent-own-item-container__delete-btn").click(
    function(){
      $(this).blur();
      $("body").append('<div id="delete-overlay"></div>');
      $(".dialog-box").fadeIn("normal");
      $("#delete-overlay").fadeIn("normal");
      $(".delete-dialog__buttons__cancel,#delete-overlay").unbind().click(function(){
        $(".dialog-box,#delete-overlay").hide();
      });
    }
  );
});

