class BookingsController < ApplicationController
  before_action :find_gift, only: [ :new ]

  def index
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
      redirect_to bookings_path
    else
      @gift = @booking.gift
      flash[:alert] = "Something went wrong with your booking"
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:message, :gift_id, :friend_name, :friend_email, :friend_phone_number)
  end

  def find_gift
    @gift = Gift.find(params[:gift_id])
  end

end
