$(document).on('turbolinks:load', function() {

  function addSelect(category) {
    var html = `<option value="${category.id}">${category.name}</option>`
    $('#search-second-category').append(html);
  };

  $('#search-first-category').change(function(){
    var root_id = $('#search-first-category option:selected').val();
    console.log(root_id);
    $.ajax({
      url: '/items/search',
      type: 'get',
      data: { root_id: root_id },
      dataType: 'json',
    })
    .done(function(category){
      $.each(category, function(index, value){
        console.log(value.name);
        $('#search-second-category').add;
      });
      $('#search-second-category').show().append(addSelect);
    });
  });
});
