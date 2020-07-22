class TicketCategoriesController < ApplicationController
  def create
    @ticket_category = TicketCategory.new(category_params)

    if @ticket_category.save
      flash[:success] = 'Item created :)'
      redirect_to request.referrer
    else
      flash[:danger] = 'Error'
      redirect_to root_url
    end
  end

  def destroy
    @ticket_category = TicketCategory.find(params[:id])

    @ticket_category.destroy
    flash[:success] = 'Item deleted :('
    redirect_to request.referrer
  end

  private

  def category_params
    params.require(:ticket_category).permit(:category_name)
  end
end
