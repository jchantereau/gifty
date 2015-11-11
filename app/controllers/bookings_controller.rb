class BookingsController < ApplicationController
  before_action :find_gift, only: [ :new, :create ]

  def new

  end

  def create
  end

  private

  def booking_params
    params.require(:booking).permit(:message, :friend_id, :gift_id, :user_id)
  end

  def find_gift
    @gift = Gift.find(params["gift"])
  end

end
