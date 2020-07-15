class AddActivationToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :activation_digest, :string
    add_column :tickets, :activated, :boolean, default: false
    add_column :tickets, :activated_at, :datetime
  end
end
