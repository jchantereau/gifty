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

    if @booking.save
      redirect_to
      flash.notice = "Your gift has been successfully booked"
      redirect_to bookings_path
    else
      @gift = @booking.gift
      flash[:alert] = "Something went wrong with your booking, please check if you are logged in"
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
