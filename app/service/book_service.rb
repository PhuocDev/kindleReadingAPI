class BookService
  def initialize(book)
    @book = book
  end

  def remove_nil
    # Xử lý logic phức tạp liên quan đến Book
    if (@book.price == nil)
      @book.price = 0
    end
  end
end
