$(document).on('turbolinks:load', function() {
  $(function(){
    function calcDays(){
      $('#user_birth_d').empty();
      var y = $('#user_birth_y').val();
      var m = $('#user_birth_m'). val();

      if (m == 2 && ((y % 400 == 0) || ((y % 4 == 0) && (y % 100 != 0)))) {
        var last = 29;
      } else {
        var last = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[m-1];
      }

      $('#user_birth_d').append('<option value="">--</option>');
      for (var i = 1; i <= last; i++) {
        if (d == i) {
          $('#user_birth_d').append('<option value="' + i + '" selected>' + i + '</option>');
        } else {
          $('#user_birth_d').append('<option value="' + i + '">' + i + '</option>');
        }
      }
    }
    var d = $('#user_birth_d');
    $('#user_birth_y').change(calcDays);
    $('#user_birth_m').change(calcDays);
  });
});
