module Coupons
  class ConfirmationController < ApplicationController
    before_action :set_booking
    before_action :check_voucher, only: [:create]
    skip_before_action :authenticate_user!

    def new
      @booking.check_date_validity
    end

    def create
      @booking.check_date_validity
      if @booking.still_valid
        @booking.complete = true
        if @booking.save
          flash[:notice] = "Voucher used!"
          redirect_to root_path
        else
          flash[:alert] = "Unable to use voucher."
          render :new
        end
      else
        flash[:alert] = "Your coupon has expired the #{@booking.ends_on}."
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
