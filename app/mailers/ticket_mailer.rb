class TicketMailer < ApplicationMailer
  def ticket_activation(ticket)
    @ticket = ticket
    mail to: ticket.client_email, subject: 'You Submited New Ticket'
  end
end
