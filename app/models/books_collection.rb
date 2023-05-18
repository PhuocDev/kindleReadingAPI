class BooksCollection < ApplicationRecord
  belongs_to :book
  belongs_to :collection

  validate :unique_book_in_collection

  private

  def unique_book_in_collection
    if BooksCollection.exists?(book_id: book_id, collection_id: collection_id)
      errors.add(:base, "This book already exists in the collection")
    end
  end
end
