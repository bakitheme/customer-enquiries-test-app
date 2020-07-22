class AddTicketStatusRefToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :ticket_status, foreign_key: true
  end
end
