# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/ticket_mailer/ticket_activation
  def ticket_activation
    ticket = Ticket.first
    ticket.activation_token = Ticket.new_token
    TicketMailer.ticket_activation(ticket)
  end

  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end
end
