class RemoveFileUrlFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :fileURL
  end
end
