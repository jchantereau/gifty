class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @bookings = current_user.bookings
    @bookings.each {|b| b.check_date_validity}
  end

  def show
    @booking = Booking.where(state: 'paid').find(params[:id])
  end

  def new
    @gift = Gift.find(params[:gift_id])
    @booking = Booking.new(gift_id: params[:gift_id])
  end

  def create
    @gift = Gift.find(params[:booking][:gift_id])
    @booking = Booking.new(booking_params)
    @booking.gift = @gift
    @booking.state = "pending"
    @booking.amount = @gift.price
    @booking.gift_sku = @gift.sku
    @booking.ends_on = Time.now + 90.days

    if @booking.save
      flash.notice = "Your gift has been successfully booked"
      if user_signed_in?
        @booking.user = current_user
        BookingMailer.creation_confirmation(@booking).deliver_now
        SmsSender.new(@booking, coupon_url(@booking.token)).send unless @booking.friend_phone_number.blank?
        redirect_to new_booking_payment_path(@booking)
      else
        session[:booking_id] = @booking.id
        redirect_to new_user_session_path
      end
    else
      raise
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
    params.require(:booking).permit(:message, :friend_name, :friend_email, :friend_phone_number, :state)
  end
end
