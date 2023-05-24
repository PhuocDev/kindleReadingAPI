class AddFieldsToAudioBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :audioURL, :string
  end
end
