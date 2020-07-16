class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :header
      t.text :content
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
