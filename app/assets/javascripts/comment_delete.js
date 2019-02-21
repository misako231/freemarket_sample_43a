$(document).on('turbolinks:load', function() {
  $(".parent-comment-container-inner").on("click", ".parent-comment-container__message-container-right__body-icons__trash-can", function(){
      $(".parent").append('<div id="delete-overlay"></div>');
      $(".dialog-box_comment").fadeIn("normal");
      $("#delete-overlay").fadeIn("normal");
      $(".delete-dialog__buttons__cancel,#delete-overlay").unbind().click(function(){
        $(".dialog-box_comment,#delete-overlay").hide();
      });
    }
  );
});
