$(document).ready(function() {
  $('.coupon-form [type=submit]').on('click', function(e) {
    if(!$(this).hasClass('is-active')) {
      e.preventDefault();
    }
  })

  if ($('.js-coupon-voucher').length) {
    invalidateVoucher = function(){
      var validation_icon = $('.js-voucher-status');
      validation_icon.removeClass("fa-check");
      validation_icon.addClass("fa-times");
      $('[type=submit]').removeClass('is-active')
    }

    validateVoucher = function(){
      var validation_icon = $('.js-voucher-status');
      validation_icon.removeClass("fa-times");
      validation_icon.addClass("fa-check");
      $('[type=submit]').addClass('is-active')
    }

    $(".js-coupon-voucher").keyup(function() {
      var voucher         = $(this).val();
      var validation_url  = null;

      if (voucher.length >= 6) {
        validation_url = $(this).data('validate-url');

        $.ajax({
          dataType: "json",
          url:      validation_url,
          data:     { voucher: voucher },
          success: function(data){
            if (data.valid) {
              validateVoucher();
            }
            else{
              invalidateVoucher();
            }
          }
        });
      }
      else {
        invalidateVoucher();
      }
    });
  }
});
