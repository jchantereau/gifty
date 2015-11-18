class SmsSender

  def initialize(booking, coupon_url)
    @booking = booking
    @coupon_url = coupon_url
  end

  def send
    message = "Hi #{@booking.friend_name}, your friend #{@booking.user.name} just offered you a drink.
Here is the code for the bar tender: #{@booking.voucher}
Click here: #{@coupon_url} to enjoy it!"
    blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])
    blowerio['/messages'].post to: "+33#{@booking.friend_phone_number[1..9]}", message: message
  end

end
