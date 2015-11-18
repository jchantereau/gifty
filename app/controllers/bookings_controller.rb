class BookingsController < ApplicationController
  before_action :find_gift, only: [ :new ]

  def index
    @bookings = current_user.bookings
    @bookings.each {|b| b.check_date_validity}
  end

  def new
    @booking = Booking.new(gift: @gift)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.ends_on = Time.now + 90.days

    if @booking.save
      flash.notice = "Your gift has been successfully booked"
      BookingMailer.creation_confirmation(@booking).deliver_now
      if @booking.friend_phone_number
        message = "Hi #{@booking.friend_name}, your friend #{@booking.user.name} just offered you a drink.
Here is the code for the bar tender: #{@booking.voucher}
Click here: #{coupon_url(@booking.token)} to enjoy it!"
        blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])
        blowerio['/messages'].post to: "+33#{@booking.friend_phone_number[1..9]}", message: message
      end
      redirect_to bookings_path
    else
      @gift = @booking.gift
      flash[:alert] = "Something went wrong with your booking"
      render :new
    end
  end

  def gifts_received
    @bookings = Booking.where(friend_email: current_user.email)
    @bookings.each {|b| b.check_date_validity}
  end

  private

  def booking_params
    params.require(:booking).permit(:message, :gift_id, :friend_name, :friend_email, :friend_phone_number)
  end

  def find_gift
    @gift = Gift.find(params[:gift_id])
  end
end
