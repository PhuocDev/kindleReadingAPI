class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[ show update destroy ]

  #add new book to a collection
  def add_new_book_to_a_collection
    collection = Collection.find(params[:collection_id])
    book = Book.find(params[:book_id])

    # Kiểm tra xem quyển sách đã tồn tại trong collection chưa
    if BooksCollection.exists?(book: book, collection: collection)
      render json: { error: "The book already exists in the collection." }, status: :unprocessable_entity
    else
      books_collection = BooksCollection.new(book: book, collection: collection)
      if books_collection.save
        render json: books_collection, status: :created
      else
        render json: { error: books_collection.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  #show all book of a collection
  def show_collection_books
    # collections = current_user.collections.includes(books: [:id] ).find(params[:id])
    # @collection = current_user.collections.find(params[:id])  #xem lại eager loading tại đây
    render json: current_user.collections.find(params[:id]).books
    # render json: current_user.collections.find(params[:id]).books
  end
  # GET /collections
  def index
    # @collections = Collection.all
    @collections = current_user.collections
    render json: @collections
  end

  # GET /collections/1
  def show
    render json: @collection
  end

  # POST /collections
  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    if @collection.save
      render json: @collection, status: :created, location: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /collections/1
  def update
    if @collection.update(collection_params)
      render json: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = current_user.collections.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:name, :collection_id, :book_id)
    end
end
