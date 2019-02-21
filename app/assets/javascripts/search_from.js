$(document).on('turbolinks:load', function() {
  // カテゴリー２層目をbuild
  function addSelect(category) {
    var html = `<option value="${category.id}" class="second-category" name='q[category_ancestry_start]'>${category.name}</option>`
    $('#child-category').append(html);
  };
  // カテゴリー３層目（チェックボックス）をbuild
  function addCategoryCheck(category) {
    var html = `<div class='checkbox__default'>
                  <input value='${category.id}' name='q[category_ancestry_end_any][]' class='child__icon' id='q_category_ancestry_end_any_${category.id}' type='checkbox'>
                  <label for='q_category_ancestry_end_any_${category.id}'>${category.name}</label>
                </div>`
    $('.select__category__grand-child').append(html);
  }
  // サイズのチェックボックスをbuild
  function addSizeCheck(size) {
    var html = `<div class='checkbox__default'>
                  <input value='${size}' name='q[category_name_eq_any][]' class='child__icon' id='q_category_name_eq_any_${size}' type='checkbox'>
                  <label for='q_category_name_eq_any_${size}'>${size}</label>
                </div>`
    $('.select__category__child').append(html);
  }
  // カテゴリー２層目を表示
  $('#search-first-category').change(function(){
    var root_id = $('#search-first-category option:selected').val();
    $.ajax({
      url: '/items/search',
      type: 'get',
      data: { root_id: root_id },
      dataType: 'json',
    })
    .always(function(categories){
      if ($('#root-category').val() == ''){
        $('#child-category').hide().empty();
        $('.select__category__grand-child').hide().empty();

      } else {
        $('#child-category').empty().show().append(`<option value>すべて</option>`);
        $('.select__category__grand-child').empty();
      }
      categories.forEach(function(category){
        addSelect(category);
      });
      $('#search-second-category').show();
    });
  });
  // カテゴリー３層目を表示
  $('#search-second-category').change(function(){
    var child_id = $('#search-second-category option:selected').val();
    $.ajax({
      url: '/items/search',
      type: 'get',
      data: { child_id: child_id },
      dataType: 'json',
    })
    .always(function(categories){
      $('.select__category__grand-child').empty().show();
      categories.forEach(function(category){
        addCategoryCheck(category);
      });
    });
  });
  // サイズを取得
  $('#size_select').change(function(){
    var size_group = $('#size_select option:selected').val();
    $.ajax({
      url: '/items/search',
      type: 'get',
      data: { size_group: size_group },
      dataType: 'json',
    })
    .always(function(size){
      console.log('ok')
      $('.select__category__child').empty().show();
      size.forEach(function(size){
        addSizeCheck(size);
      });
    });
  });
  // 金額の選択肢を入力欄に反映
  $('#search_price').change(function(){
    var price_range = $('#search_price').val().split('-');
    $('#q_price_gteq').val(price_range[0]);
    $('#q_price_lteq').val(price_range[1]);
  });
  // ソートのリンクを指定
  $('#sort').change(function(){
    if ($(this).val() == '') {
    } else if ($(this).val() == 'price-asc') {
      window.location.href = $('#price-asc').text();
    } else if ($(this).val() == 'price-desc') {
      window.location.href = $('#price-desc').text();
    } else if ($(this).val() == 'id-asc') {
      window.location.href = $('#id-asc').text();
    } else if ($(this).val() == 'id-desc') {
      window.location.href = $('#id-desc').text();
    }
  });
  // 商品状態をすべてチェック
  if ($(".condition-check:not(:checked)").size() == 0 ) {
    $('#check-all').prop('checked', true);
  }
  $('.condition-check').on('change', function() {
    if ($(".condition-check:not(:checked)").size() == 0 ) {
      $('#check-all').prop('checked', true);
    }
  });
  $('#check-all').on('change', function() {
    $('.condition-check').prop('checked', this.checked);
  });
  // クリアボタン
  $('.btn__gray').on('click', function(){
    $('#root-category').val('');
    $('#child-category').empty().hide();
    $('.select__category__grand-child').empty().hide();
    $('#size-select').val('');
    $('.select__category__child').empty().hide();
    $('#check-all').prop('checked', false);
    $('.condition-check').prop('checked', false);
    $('.input__default').val('');
    $('.default-radio').prop('checked', true);
  });
});
