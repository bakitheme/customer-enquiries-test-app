class CreateTicketStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_statuses do |t|
      t.string :status_name

      t.timestamps
    end
  end
end
