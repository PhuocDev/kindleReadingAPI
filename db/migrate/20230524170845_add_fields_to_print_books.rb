class AddFieldsToPrintBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :stock, :integer
  end
end
