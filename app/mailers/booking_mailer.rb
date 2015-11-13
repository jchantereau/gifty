class BookingMailer < ApplicationMailer
  def creation_confirmation(booking)
    @booking = booking

    mail(
      to:       @booking.friend_email,
      subject:  "#{@booking.user.name} just offered you a drink!"
    )
  end
end
