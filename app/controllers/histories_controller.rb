class HistoriesController < ApplicationController
  def create
    @history = History.new(history_params)

    if @history.save
      flash[:success] = 'Changes accepted :)'
      redirect_to request.referrer
    else
      redirect_to root_url
    end
  end

  def destroy
    @history = History.find(params[:id])

    @history.destroy
    flash[:success] = 'Item deleted :('
    redirect_to request.referrer
  end

  private

  def history_params
    params.require(:history).permit(:header, :content, :ticket_id)
  end
end
