$(document).on('turbolinks:load', function() {

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
  // カテゴリー３層目を変更
  function changeAttr(category_id) {
    var html =
    `<select id="grand_category_id" class="grand_child_id" name="item[category_id]">
      <option selected="selected" value="${category_id}"></option>
    </select>`
    $('#new-third-category').append(html)
    $('#grand_category_id').css('display','none');
  }

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
  $('#new-first-category').change(function(){
    var root_id = $('#new-first-category option:selected').val();
    $('#child-category').empty().append(`<option value>---</option>`);
    $('#grand-child-category').empty().append(`<option value>---</option>`);
    $('#great-grand-child-category').empty().append(`<option value>---</option>`)
    $('#new-second-category').css('display','none');
    $('#new-third-category').css('display','none');
    $('#item-size').css('display','none')
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
        $("#new-second-category").css('display','block');
      });
    });
  });
  // カテゴリー３層目を表示
  $('#new-second-category').change(function(){
    var child_id = $('#new-second-category option:selected').val();
    $('#grand-child-category').empty().append(`<option value>---</option>`);
    $('#great-grand-child-category').empty().append(`<option value>---</option>`)
    $('#new-third-category').css('display','none');
    $('#item-size').css('display','none')
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
        $("#new-third-category").css('display','block');
      });
    });
  });
  // カテゴリー4層目を表示
  $('#new-third-category').change(function(){
    var grand_child_id = $('#new-third-category option:selected').val();
    console.log(grand_child_id);
    $('#item-size').css('display','none')
    $.ajax({
      url: '/items/new',
      type: 'get',
      data: { grand_child_id: grand_child_id },
      dataType: 'json'
    })
    .always(function(categories){
      console.log(categories)
      if(categories.length !== 0) {
        $('#new-size-category').append($('<select id="grand_category_id" class="select__default" name="item[category_id]">'));
        $('#grand_category_id').empty().append(`<option value>---</option>`);
        categories.forEach(function(category){
          addSelectGreatGrandChildren(category)
          $('#item-size').css('display','block')
        });
      }
      else {
        $('#item-size').css('display','none');
        changeAttr(grand_child_id)
      }
    });
  });

   // 配送方法の指定
  $('#item_shipping_fee').change(function(){
    var shipping_fee = $('#item_shipping_fee option:selected').val();
    $('#item_transportation').remove();
    console.log(shipping_fee);
    if(shipping_fee == 'self_burden') {
      $('#new-transportation').append($('<select id="item_transportation" class="select__default" name="item[transportation]">'));
      $('#item_transportation').empty();
      selfHTML(shipping_fee)
      $('#transportation_method').css('display','block');
    }
    else if(shipping_fee == 'other'){
      $('#new-transportation').append($('<select id="item_transportation" class="select__default" name="item[transportation]">'));
      $('#item_transportation').empty();
      otherHTML(shipping_fee)
      $('#transportation_method').css('display','block');
    }
    else {
      $('#transportation_method').css('display','none');
    }
  })


  // $('.btn__default').click(function(){
  //   $("body").append('<div id="delete-overlay"></div>');
  //   $("#delete-overlay").fadeIn("normal");
  //   $('.modal').fadeIn();
  // });

  $('#sell__form').on('submit', function(){
    var formData = new FormData(this);
    var url = $(this).attr('action');
    console.log(formData);
    console.log(url);
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      console.log(data);
      $("body").append('<div id="delete-overlay"></div>');
      $("#delete-overlay").fadeIn("normal");
      $('.modal').fadeIn();
    })

    .fail(function(data){
    })

    .always(function(data){
      $("#new-item-btn").prop("disabled", false);
    })
  });
});
