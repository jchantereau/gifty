class CouponsController < ApplicationController
  before_action :set_booking

  def show
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
