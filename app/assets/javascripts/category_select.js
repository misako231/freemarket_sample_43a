$(document).on('turbolinks:load', function() {

  function addSelect(category) {
    var html = `<option value="${category.id}" class="second-category">${category.name}</option>`
    $('#child-category').append(html);
  };

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
});
