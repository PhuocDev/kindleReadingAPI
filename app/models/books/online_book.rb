class OnlineBook < Book
  # Các thuộc tính riêng cho OnlineBook (fileURL)
  validates :fileURL, presence: true
  self.inheritance_column = :book_type
end
