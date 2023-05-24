class OnlineBook < Book
  # Các thuộc tính riêng cho OnlineBook (fileURL)
  validates :fileURL, presence: true
end
