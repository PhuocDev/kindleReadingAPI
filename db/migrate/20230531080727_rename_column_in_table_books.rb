class RenameColumnInTableBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :book_type, :type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
