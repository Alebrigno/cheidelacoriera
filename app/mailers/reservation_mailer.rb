# frozen_string_literal: true

class ReservationMailer < ApplicationMailer
  def received(reservation)
    @reservation = reservation
    @user = @reservation.user
    @event = @reservation.event

    mail(
      to: @user.email,
      subject: "Richiesta Ricevuta | #{@event} | Chei De La Coriera"
    )
    @reservation.update(mail_sent: Date.today)
  end

  def approved(reservation)
    @reservation = reservation
    @user = @reservation.user
    @event = @reservation.event

    mail(
      to: @user.email,
      subject: "Richiesta Approvata | #{@event} | Chei De La Coriera"
    )
    @reservation.update(mail_sent: Date.today)
  end

  def rejected(reservation)
    @reservation = reservation
    @user = @reservation.user
    @event = @reservation.event

    mail(
      to: @user.email,
      subject: "Richiesta Declinata | #{@event} | Chei De La Coriera"
    )
    @reservation.update(mail_sent: Date.today)
  end
end
