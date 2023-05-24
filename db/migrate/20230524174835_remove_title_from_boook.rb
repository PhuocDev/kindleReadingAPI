class RemoveTitleFromBoook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :title
  end
end
