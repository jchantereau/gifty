module Coupons
  class ConfirmationController < ApplicationController
    before_action :set_booking
    before_action :check_voucher, only: [:create]

    def new
    end

    def create
      @booking.complete = true

      if @booking.save
        flash[:notice] = "Voucher used!"
        redirect_to root_path
      else
        flash[:alert] = "Unable to use voucher."
        render :new
      end
    end

    private

    def check_voucher
      if params[:voucher] != @booking.voucher
        flash[:alert] = "Wrong voucher"
        render :new
      end
    end

    def set_booking
      @booking = Booking.where(token: params[:coupon_id], complete: false).first!
    end
  end
end
