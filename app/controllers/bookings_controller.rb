class BookingsController < ApplicationController

  def new
    @booking = Booking.new(gift_id: params["gift"])
  end

end
