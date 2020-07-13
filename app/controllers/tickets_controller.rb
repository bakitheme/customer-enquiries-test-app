class TicketsController < ApplicationController
  def new; end

  def index
    @tickets = Ticket.all
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:success] = 'Request successfuly created'
      redirect_to root_url
    else
      flash[:danger] = 'Error'
      redirect_to root_url
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:client_name, :client_email, :ticket_category_id, :ticket_status_id, :subject, :content)
  end
end
