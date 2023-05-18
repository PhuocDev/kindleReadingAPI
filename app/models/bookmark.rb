class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :location

end
