class CouponsController < ApplicationController
  before_action :set_booking
  skip_before_action :authenticate_user!

  def show
    @booking.check_date_validity
  end

  def validate
    valid = (@booking.voucher == params[:voucher])

    render json: { valid: valid }
  end

  private

  def set_booking
    @booking = Booking.where(token: params[:id], complete: false).first!
  end
end
