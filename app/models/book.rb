class Book < ApplicationRecord
  has_and_belongs_to_many :collections
  has_many :bookmarks


  validates :name, presence: true, uniqueness: true
  validates :author, presence: true
  has_many :highlights

  # Đảm bảo mỗi đối tượng Book có một loại hợp lệ
  validates :book_type, inclusion: { in: %w[OnlineBook PrintBook AudioBook] }

  # Tạo phạm vi cho mỗi loại sách
  scope :online_books, -> { where(book_type: 'OnlineBook') }
  scope :print_books, -> { where(book_type: 'PrintBook') }
  scope :audio_books, -> { where(book_type: 'AudioBook') }

end

