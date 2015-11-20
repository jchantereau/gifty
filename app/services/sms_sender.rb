class SmsSender

  def initialize(booking, coupon_url)
    @booking = booking
    @coupon_url = coupon_url
  end

  def send
    message = "Hi #{@booking.friend_name[0..11]}, your friend #{@booking.user.name[0..11]} just offered you a drink. Click here to enjoy it: http://gifty.xyz/coupons/#{@booking.token}. Validation code: #{@booking.voucher}. Gifty Team,"
    blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])
    blowerio['messages'].post(to: "+33#{@booking.friend_phone_number[1..9]}", message: message)
  end

end
