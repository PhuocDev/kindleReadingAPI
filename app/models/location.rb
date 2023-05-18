class Location < ApplicationRecord
  has_many :bookmarks

  validates :page, presence: true
end
