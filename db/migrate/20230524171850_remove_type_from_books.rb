class RemoveTypeFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :type
    add_column :books, :book_type, :string
  end
end
