class AddContentToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :content, :text, default: "This is the sample content of the book"
  end
end
