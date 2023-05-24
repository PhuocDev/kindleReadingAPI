class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show update destroy ]

  # Get the latest bookmark
  def latest
    book = Book.find(params[:book_id]) # Assuming book_id is the ID of the book
    @latest_bookmark = Bookmark.where(user: current_user, book: book).order(created_at: :desc).first
    # @bookmark = current_user.bookmarks.order(created_at: :desc).first
    render json: @latest_bookmark
  end
  # GET /bookmarks
  def index
    @bookmarks = current_user.bookmarks
    render json: @bookmarks
  end

  # GET /bookmarks/1
  def show
    render json: @bookmark
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @location = Location.find_or_initialize_by(page: location_params[:page], x: location_params[:x], y: location_params[:y],
      width: location_params[:width], height: location_params[:height])
    # @location.save
    # # Lưu location nếu chưa tồn tại
    if @location.new_record?
      @location.save
    end

    # Gán location_id cho highlight
    @bookmark.location_id = @location.id
    if @bookmark.save
      render json: @bookmark, status: :created, location: @bookmark
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    if @bookmark.update(bookmark_params)
      render json: @bookmark
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = current_user.bookmarks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit( :book_id, :location_id)
    end
    def location_params
      params.require(:location).permit(:page, :x, :y, :width, :height)
    end
end
