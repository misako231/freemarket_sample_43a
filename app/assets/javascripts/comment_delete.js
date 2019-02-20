$(document).on('turbolinks:load', function() {
  $(document).on("click", ".parent-comment-container__message-container-right__body-icons__trash-can", function(){
      $(".parent").append('<div id="delete-overlay"></div>');
      $(".dialog-box").fadeIn("normal");
      $("#delete-overlay").fadeIn("normal");
      $(".delete-dialog__buttons__cancel,#delete-overlay").unbind().click(function(){
        $(".dialog-box,#delete-overlay").hide();
      });
    }
  );
});
