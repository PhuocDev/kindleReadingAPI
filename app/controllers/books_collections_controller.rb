class BooksCollectionsController < ApplicationController
  before_action :set_books_collection, only: %i[ show update destroy ]

  # GET /books_collections
  def index
    @books_collections = BooksCollection.all

    render json: @books_collections
  end

  # GET /books_collections/1
  def show
    render json: @books_collection
  end

  # POST /books_collections
  def create
    @books_collection = BooksCollection.new(books_collection_params)

    if @books_collection.save
      render json: @books_collection, status: :created, location: @books_collection
    else
      render json: @books_collection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books_collections/1
  def update
    if @books_collection.update(books_collection_params)
      render json: @books_collection
    else
      render json: @books_collection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books_collections/1
  def destroy
    @books_collection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_books_collection
      @books_collection = BooksCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def books_collection_params
      params.require(:books_collection).permit(:book_id, :collection_id)
    end
end
