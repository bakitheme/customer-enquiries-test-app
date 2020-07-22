class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :client_name
      t.string :client_email
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
