$(document).on('turbolinks:load', function() {
  function totalPrice() {
    var itemPrice = $('.items__buy-cf__container__main__content__inner__buy-form__buy-price-box-price > span').data('buy-pay');
        point = $('input[data-buy="result"]').val();
    if (itemPrice > point) {
      totalPay = itemPrice - point;
    }  else {
      totalPay = 0
    }
    var totalPay = String(totalPay).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    $('.items__buy-cf__container__main__content__inner__buy-form__buy-price-box-price > span').text(`¥ ${totalPay}`);
  };

  $('.items__buy-cf__container__main__content__inner__buy-form__accordion-toggle').on('click', function() {
    $('.items__buy-cf__container__main__content__inner__buy-form__accordion-child').slideToggle('nomal');
    $('.items__buy-cf__container__main__content__inner__buy-form__accordion-toggle-angle > i').toggleClass('fa-angle-up');
  });

  $('input[name=consume_point_radio]:radio').change(function() {
    var radio = $(this).val();
    $('[data-buy="result"]').val(radio);
    totalPrice();
  });

  $('input[data-buy="part_num"]').on('keyup', function() {
    var partPoint = $(this).val();
    $('[data-buy="part"], [data-buy="result"]').val(partPoint);
    totalPrice();
  });

  $('input[data-buy="part_num"]').on('click', function() {
    $('[data-buy="part"]').prop('checked', true);
    totalPrice();
  });
});
