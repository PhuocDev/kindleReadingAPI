class Book < ApplicationRecord
  has_and_belongs_to_many :collections
  has_many :bookmarks


  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  has_many :highlights
end
