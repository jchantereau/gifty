class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  def after_sign_in_path_for(resource)
    if session[:booking_id]
      @booking = Booking.find(session[:booking_id])
      @booking.user = current_user
      @booking.save
      session[:booking_id] = nil
      BookingMailer.creation_confirmation(@booking).deliver_now
      SmsSender.new(@booking, coupon_url(@booking.token)).send unless @booking.friend_phone_number.blank?
      bookings_path
    else
      super
    end
  end

end
