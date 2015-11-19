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
      new_booking_payment_path(@booking)
    else
      super
    end
  end

end
