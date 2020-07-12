class TicketsController < ApplicationController
  def new; end

  def create
    @ticket = Tickets.new(ticket_params)

    if @ticket.save
      flash.now[:success] = 'Request successfuly created'
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:client_name, :client_email, :subject, :content)
  end
end
