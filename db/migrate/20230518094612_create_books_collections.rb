class CreateBooksCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :books_collections do |t|
      t.references :book, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
