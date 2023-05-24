class AddTypeToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :type, :string, default: "OnlineBook"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
