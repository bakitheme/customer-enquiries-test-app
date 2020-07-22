module TicketsHelper
  def is_owner?
    @current_user.id == @ticket.user_id
  end

  def ownership?
    !@ticket.user_id.nil?
  end
end
