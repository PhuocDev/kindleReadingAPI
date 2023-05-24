class PrintBook < Book
  # Các thuộc tính riêng cho PrintBook (stock)
  validates :stock, presence: true
end
