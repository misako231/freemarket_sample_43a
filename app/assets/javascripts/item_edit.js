$(document).on('turbolinks:load', function() {

  // ２層目のbiuld
  function addSelectChildren(category) {
    var html = `<option value="${category.id}" class="second-category">${category.name}</option>`
    $('#child-category').append(html);
  };

  // カテゴリー３層目をbuild
  function addSelectGrandChildren(category) {
    var html = `<option value="${category.id}" class="third-category">${category.name}</option>`
    $('#grand-child-category').append(html);
  };

    // カテゴリー4層目をbuild
  function addSelectGreatGrandChildren(category) {
    var html =
    `<option value="${category.id}" class="fourth-category">${category.name}</option>`
    $('#grand_category_id').append(html);
  }
  // ４層目のセレクトボックスの値を変更
  function changeAttr(category_id) {
    var html =
    `<select id="grand_category_id" class="grand_child_id" name="item[category_id]">
      <option selected="selected" value="${category_id}"></option>
    </select>`
    $('#edit-third-category').append(html)
    $('#grand_category_id').css('display','none');
  }

  // 送料（自己負担時）の配送方法を表示
  function selfHTML(shipping_fee) {
    var html =
    `<option value="">---</option>
    <option value="nodecided">未定</option>
    <option value="merukaribin">メルカリ便</option>
    <option value="yuumail">ゆうメール</option>
    <option value="letter">レターパック</option>
    <option value="ordinary">普通郵便(定形、定形外)</option>
    <option value="kuroneko">クロネコ</option>
    <option value="yuupack">ゆうパック</option>
    <option value="clickpost">クリックポスト</option>
    <option value="yuupaket">ゆうパケット</option>`
    $('#item_transportation').append(html);
  }

  // 送料（着払い時）の配送方法を表示
  function otherHTML(shipping_fee) {
    var html =
    `<option value="">---</option>
    <option value="nodecided">未定</option>
    <option value="kuroneko">クロネコ</option>
    <option value="yuupack">ゆうパック</option>
    <option value="yuumail">ゆうメール</option>`
    $('#item_transportation').append(html);
  }

  // カテゴリー２層目を表示
  $('#edit-first-category').change(function(){
    var root_id = $('#edit-first-category option:selected').val();
    $('#child-category').empty().append(`<option value>---</option>`);
    $('#grand-child-category').empty().append(`<option value>---</option>`);
    $('#great-grand-child-category').empty().append(`<option value>---</option>`)
    $('#edit-second-category').css('display','none');
    $('#edit-third-category').css('display','none');
    $('#edit-item-size').css('display','none')
    $("#edit-item-category-id").remove();
    $('#grand_category_id').remove();
    $.ajax({
      url: '/items/new',
      type: 'get',
      data: { root_id: root_id },
      dataType: 'json',
    })
    .always(function(categories){
      console.log(categories);
      categories.forEach(function(category){
        console.log(category);
        addSelectChildren(category);
        $("#edit-second-category").css('display','block');
      });
    });
  });

  $('#edit-second-category').change(function(){
    var child_id = $('#edit-second-category option:selected').val();
    $('#grand-child-category').empty().append(`<option value>---</option>`);
    $('#great-grand-child-category').empty().append(`<option value>---</option>`)
    $('#edit-third-category').css('display','none');
    $('#edit-item-size').css('display','none')
    $("#edit-item-category-id").remove();
    $('#grand_category_id').remove();
    $.ajax({
      url: '/items/new',
      type: 'get',
      data: { child_id: child_id },
      dataType: 'json',
    })
    .always(function(categories){
      categories.forEach(function(category){
        console.log(category);
        addSelectGrandChildren(category);
        $("#edit-third-category").css('display','block');
      });
    });
  });

  // カテゴリー4層目を表示
  $('#edit-third-category').change(function(){
    var grand_child_id = $('#edit-third-category option:selected').val();
    console.log(grand_child_id);
    $('#edit-item-size').css('display','none')
    $("#edit-item-category-id").remove();
    $('#grand_category_id').remove();
    $.ajax({
      url: '/items/new',
      type: 'get',
      data: { grand_child_id: grand_child_id },
      dataType: 'json'
    })
    .always(function(categories){
      console.log(categories)
      if(categories.length !== 0) {
        $('#edit-size-category').append($('<select id="grand_category_id" class="select__default" name="item[category_id]">'));
        $('#grand_category_id').empty().append(`<option value>---</option>`);
        categories.forEach(function(category){
          addSelectGreatGrandChildren(category)
          $('#edit-item-size').css('display','block')
        });
      }
      else {
        $('#edit-item-size').css('display','none');
        changeAttr(grand_child_id)
      }
    });
  });

   // 配送方法の指定
  $('#edit-item-shipping-fee').change(function(){
    var shipping_fee = $('#edit-item-shipping-fee option:selected').val();
    $('#item_transportation').remove();
    console.log(shipping_fee);
    if(shipping_fee == 'self_burden') {
      $('#edit-transportation').append($('<select id="item_transportation" class="select__default" name="item[transportation]">'));
      $('#item_transportation').empty();
      selfHTML(shipping_fee)
      $('#transportation_method').css('display','block');
    }
    else if(shipping_fee == 'other'){
      $('#edit-transportation').append($('<select id="item_transportation" class="select__default" name="item[transportation]">'));
      $('#item_transportation').empty();
      otherHTML(shipping_fee)
      $('#transportation_method').css('display','block');
    }
    else {
      $('#transportation_method').css('display','none');
    }
  })

  // キーを押した時の価格の計算
  $('#edit-item-price').on('keyup ready', function(){
    var price = $(this).val();
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

  // ロードが完了した時の価格の計算
  $('#edit-item-price').ready(function(){
    var price = $('#edit-item-price').val();
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
