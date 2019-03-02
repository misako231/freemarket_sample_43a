function buildHTML(item_id,id){
  var html = `
  <div class="dialog-box_comment" data-comment-id = "${id}">
    <div class="delete-dialog">
      <div class="delete-dialog__message">
        <p>確認</p>
        <h2>削除されたコメントは元に戻せません。</h2><br><br>
        <h2>本当に削除しますか？</h2>
      </div>
      <div class="delete-dialog__buttons">
        <div class="delete-dialog__buttons__cancel">キャンセル</div>
        <div class="delete-dialog__buttons__submit">
          <a href="/items/${item_id}/comments/${id}", data-method = "delete", class = "confirm_delete">
            コメントを削除する</a>
        </div>
      </div>
    </div>
  </div>
  <div id="delete-overlay"></div>`
  return html;
}


$(document).on('turbolinks:load', function() {
  $(".parent-comment-container-inner").on("click", ".parent-comment-container__message-container-right__body-icons__trash-can", function(){
      var id = $(this).attr('data-comment-id');
      var item_id = $(this).attr('data-item-id');
      var modal_html = buildHTML(item_id,id)
      $("#comment_delete_array").append(modal_html);
      $(".parent").append('<div id="delete-overlay"></div>');
      $(".dialog-box_comment").fadeIn("normal");
      $("#delete-overlay").fadeIn("normal");
      $(".delete-dialog__buttons__cancel,#delete-overlay").unbind().click(function(){
        $(".dialog-box_comment,#delete-overlay").hide();
      });
    }
  );
});
