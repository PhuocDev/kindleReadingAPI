class AudioBook < Book
  # Các thuộc tính riêng cho AudioBook (audioURL)
  validates :audioURL, presence: true
end
