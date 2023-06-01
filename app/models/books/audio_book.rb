class AudioBook < Book
  # Các thuộc tính riêng cho AudioBook (audioURL)
  validates :audioURL, presence: true
  self.inheritance_column = :book_type
end
