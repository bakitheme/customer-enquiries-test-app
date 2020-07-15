class TicketActivationsController < ApplicationController
  def edit
    ticket = Ticket.find_by(client_email: params[:client_email])

    if ticket && !ticket.activated? && ticket.active?(params[:id])
      ticket.update_attribute(:activated, true)
      ticket.update_attribute(:activated_at, Time.zone.now)
      log_in ticket
      flash[:success] = 'Your request activated!'
      redirect_to create_path
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end
end
