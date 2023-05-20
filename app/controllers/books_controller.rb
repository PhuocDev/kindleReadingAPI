class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # Export to pdf
  def export_pdf
    book = Book.find(params[:id])

    # Tạo file PDF từ dữ liệu quyển sách
    pdf = WickedPdf.new.pdf_from_string(generate_pdf_content(book))

    # Gửi file PDF dưới dạng phản hồi JSON
    send_data pdf, filename: 'book.pdf', type: 'application/pdf'
  end

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    # @book.update(active: true) if @book.active == false
    if @book.collections.exists?(user_id: current_user.id)
      # Set thuộc tính active của quyển sách thành true
      @book.update(active: true)
    end
    render json: @book

  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    render json: 'Deleted book successfully'
  end

  private

    def generate_pdf_content(book)
      # Tạo nội dung PDF từ dữ liệu quyển sách, ví dụ:
      content = "Name of the book: #{book.title}\n"
      content += "Author: #{book.author}\n"
      content += "Content: #{book.content}\n"
      # Thêm các thông tin khác của quyển sách

      return content
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :author, :title, :description, :price, :fileURL)
    end
end
