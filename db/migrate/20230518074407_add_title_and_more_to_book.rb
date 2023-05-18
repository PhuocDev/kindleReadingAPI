class AddTitleAndMoreToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :title, :string
    add_column :books, :description, :text
    add_column :books, :price, :decimal
    add_column :books, :fileURL, :string
  end
end
