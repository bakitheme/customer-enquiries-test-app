class TicketStatusesController < ApplicationController
  def create
    @ticket_status = TicketStatus.new(status_params)

    if @ticket_status.save
      flash[:success] = 'Item created :)'
      redirect_to request.referrer
    else
      flash[:danger] = 'Error'
      redirect_to root_url
    end
  end

  def destroy
    @ticket_status = TicketStatus.find(params[:id])

    @ticket_status.destroy
    flash[:success] = 'Item deleted :('
    redirect_to request.referrer
  end

  private

  def status_params
    params.require(:ticket_status).permit(:status_name,
                                          :color)
  end
end
