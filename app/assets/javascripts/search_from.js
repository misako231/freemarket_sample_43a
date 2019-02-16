$(document).on('turbolinks:load', function() {
  // カテゴリー２層目をbuild
  function addSelect(category) {
    var html = `<option value="${category.id}" class="second-category">${category.name}</option>`
    $('#child-category').append(html);
  };
  // カテゴリー３層目（チェックボックス）をbuild
  function addCheck(category) {
    var html = `<div class='checkbox__default'>
                  <label for='q_category_ancestry_end_any_/${category.id}'>
                    <input value='/${category.id}' name='q[category_ancestry_end_any][]' class='child__checkbox' id='q_category_ancestry_end_any_/${category.id}' type='checkbox'>
                    <span class='checkbox__icon'></span>
                    ${category.name}
                  </label>
                </div>`
    $('.select__category__grand-child').append(html);
  }
  // カテゴリー２層目を表示
  $('#search-first-category').change(function(){
    var root_id = $('#search-first-category option:selected').val();
    console.log(root_id);
    $.ajax({
      url: '/items/search',
      type: 'get',
      data: { root_id: root_id },
      dataType: 'json',
    })
    .always(function(categories){
      $('#child-category').empty().append(`<option value>すべて</option>`);
      $('.select__category__grand-child').empty();
      categories.forEach(function(category){
        addSelect(category);
      });
      $('#search-second-category').show();
    });
  });
  // カテゴリー３層目を表示
  $('#search-second-category').change(function(){
    var child_id = $('#search-second-category option:selected').val();
    console.log(child_id);
    $.ajax({
      url: '/items/search',
      type: 'get',
      data: { child_id: child_id },
      dataType: 'json',
    })
    .always(function(categories){
      $('.select__category__grand-child').empty();
      categories.forEach(function(category){
        addCheck(category);
      });
    });
  });
  // 金額の選択肢を入力欄に反映
  $('#search_price').change(function(){
    var price_range = $('#search_price').val().split('-');
    $('#q_price_gteq').val(price_range[0]);
    $('#q_price_lteq').val(price_range[1]);
  });
});
