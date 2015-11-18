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
    #envoie email ou sms
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
