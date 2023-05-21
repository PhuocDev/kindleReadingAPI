class Highlight < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :location
end
