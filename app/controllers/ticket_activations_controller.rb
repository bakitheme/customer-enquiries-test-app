class TicketActivationsController < ApplicationController
  def edit
    ticket = Ticket.find_by(client_email: params[:client_email])

    if ticket && !ticket.activated?(:activation, params[:id])
      ticket.activate
      flash[:success] = 'Ticket activated!'
      redirect_to ticket
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end
end
