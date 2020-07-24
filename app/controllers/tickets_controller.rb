class TicketsController < ApplicationController
  include TicketsHelper
  include ActiveModel::Dirty

  def new; end

  def index
    @statuses = TicketStatus.all

    if params[:search]
      @tickets = Ticket.where('reference LIKE :search
                               OR content LIKE :search
                               OR subject LIKE :search', search: "%#{params[:search]}%")
    else
      @tickets = Ticket.where(activated: true)
    end

    redirect_to root_url unless logged_in?
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      @ticket.send_activation_email

      History.create!(header: 'This ticket created',
                      content: "Ticket author: #{@ticket.client_name} topic
                                of this ticket - #{@ticket.subject}",
                      ticket_id: @ticket.id )

      flash[:success] = 'Check your e-mail for ticket activation'
      redirect_to root_url
    else
      flash[:danger] = 'Error'
      redirect_to root_url
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @histories = History.where(ticket_id: params[:id])

    redirect_to tickets unless @ticket.activated?
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update_attributes(ticket_params)
      flash[:success] = 'Successfully changed :)'

      if logged_in?
        if @ticket.previous_changes['ticket_status_id']
          History.create!(header: "#{@current_user.name} | updated ticket",
                          content: "Ticket status now is:
                                    #{@ticket.ticket_status.status_name}",
                          ticket_id: @ticket.id )
        end

        if @ticket.previous_changes['user_id']
          if @ticket.user_id.nil?
            History.create!(header: "#{@current_user.name} | updated ticket",
                            content: "Ticket ownership canceled",
                            ticket_id: @ticket.id )
          else
            History.create!(header: "#{@current_user.name} | updated ticket",
                            content: "Ticket owner now is:
                                      #{@ticket.user.name}",
                            ticket_id: @ticket.id )
          end
        end
      else
        History.create!(header: "#{@ticket.client_name} | updated ticket",
                        content: @ticket.content,
                        ticket_id: @ticket.id )
      end
      redirect_to request.referrer
    else
      render 'edit'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])

    @ticket.destroy
    flash[:success] = 'Item deleted :('
    redirect_to request.referrer
  end

  private

  def ticket_params
    params.require(:ticket).permit(:client_name,
                                   :client_email,
                                   :ticket_category_id,
                                   :ticket_status_id,
                                   :user_id,
                                   :subject,
                                   :content,
                                   :reference,
                                   :search)
  end
end
