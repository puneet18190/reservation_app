class ReservationMailer < ApplicationMailer
  def send_reservation_details_to_guest(guest, reservation)
    @guest = guest
    @reservation = reservation
    mail(to: @guest.email, subject: "Reservation Details for #{@reservation.restaurant.name}")
  end

  def send_reservation_details_to_restaurant(guest, reservation)
    @guest = guest
    @reservation = reservation
    mail(to: @reservation.restaurant.email, subject: "Reservation Details for #{@guest.name}")
  end
end
