class Location < ApplicationRecord
  has_many :bookmarks
  has_many :highlights
  validates :page, presence: true

  # validates :text, uniqueness: { scope: [:location_id, :book_id], message: "should be unique for each location and book" }, if: :location_and_book_present?

  # private

  # def location_and_book_present?
  #   location_id.present? && book_id.present?
  # end
end
