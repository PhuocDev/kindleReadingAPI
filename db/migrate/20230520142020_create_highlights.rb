class CreateHighlights < ActiveRecord::Migration[7.0]
  def change
    create_table :highlights do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :location_id
      t.text :text
      t.timestamps
    end
  end
end
