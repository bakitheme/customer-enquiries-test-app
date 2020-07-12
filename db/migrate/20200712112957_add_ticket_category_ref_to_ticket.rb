class AddTicketCategoryRefToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :ticket_category, foreign_key: true
  end
end
