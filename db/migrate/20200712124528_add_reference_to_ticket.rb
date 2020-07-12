class AddReferenceToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :reference, :string
  end
end
