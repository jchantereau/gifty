class PaymentsController < ApplicationController
  before_action :find_booking

  def new
  end

  def create
    @amount = @booking.amount_cents

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email: params[:stripeEmail]
    )
    # You should store this customer id and re-use it.

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount:       @amount,  # in cents
      description:  "Payment for #{@booking.gift_sku} for booking #{@booking.id}",
      currency:     'eur'
    )

    @booking.update(payment: charge.to_json, state: 'paid')
    flash.notice = "Your gift has been successfully booked"
    BookingMailer.creation_confirmation(@booking).deliver_now unless @booking.friend_email.blank?
    SmsSender.new(@booking, coupon_url(@booking.token)).send unless @booking.friend_phone_number.blank?
    redirect_to booking_path(@booking)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_booking_payment_path(@booking)
  end

private

  def find_booking
    @booking = Booking.where(state: 'pending').find(params[:booking_id])
  end
end
