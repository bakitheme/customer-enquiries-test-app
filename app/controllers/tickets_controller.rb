class TicketsController < ApplicationController
  def new; end

  def index
    @tickets = Ticket.where(activated: true)
    @statuses = TicketStatus.all

    redirect_to root_url unless logged_in?
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      @ticket.send_activation_email
      flash[:success] = 'Check your e-mail for ticket activation'
      redirect_to root_url
    else
      flash[:danger] = 'Error'
      redirect_to root_url
    end
  end

  def edit

  end

  private

  def ticket_params
    params.require(:ticket).permit(:client_name,
                                   :client_email,
                                   :ticket_category_id,
                                   :ticket_status_id,
                                   :subject,
                                   :content,
                                   :reference)
  end
end
