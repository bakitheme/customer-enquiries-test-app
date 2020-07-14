class AddColorToTicketStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :ticket_statuses, :color, :string
  end
end
