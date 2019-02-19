$(document).on('turbolinks:load', function() {
  preview = $(".sell__upload__items__container");
  inputnum = 0
  deletenum = 0
  number = 0
  function buildImageHTML(file){
          var html =
                `<li class="sell__upload__item">
                   <figure class="sell__upload__figure landscape">
                     <img src="${ file.target.result }", width="114", height="100">
                   </figure>
                   <div class="sell__upload__button">
                     <a href="" class="sell__upload__edit">編集</a>
                     <a id="delete-btn-${inputnum}">削除</a>
                   </div>
                 </li>`
        preview.append(html);
        $('.sell__upload__drop-box.have__item-'+ inputnum +'').css('display','none')
        inputnum +=1;
        $('.sell__upload__drop-box.have__item-'+ inputnum +'').css('display','block')
        deletenum +=1
    }

  $('form').on('change', 'input[type="file"]',function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        preview = $(".sell__upload__items__container");
        t = this;
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        buildImageHTML(e);
      };
    })(file);
    reader.readAsDataURL(file);
  });


  // $('#delete-btn-0').click(function(){
  //   $('.file-0').after('<input name="item[item_photos_attributes][][image]" multiple="multiple" class="file-0-new" type="file" id="item_item_photos_attributes_0_image">');
  //   $('.file-0').remove();
  //   $('#file_new').attr('id','file-0');
  //   $('.sell__upload__drop-box.have__item-1').css('display','none');
  //   $('.sell__upload__drop-box.have__item-0').css('display','block');
  // });


  $('#new-item-price').on('keyup', function(){
    var price = $(this).val();
    console.log(price);
    var taxrate = 0.1;
    if(price > 300 && price < 9999999) {
      var tax = Math.floor(price * taxrate);
      var taxtoString;
      taxToString = String(tax).replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
      var profit = Math.floor(price - tax);
      profitToString = String(profit).replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
      $(".tax-label__right").text("¥" + taxToString);
      $(".profit-label__right").text("¥" + profitToString);
    } else {
      $(".tax-label__right").text("-");
      $(".profit-label__right").text("-");
    }
  });
});
