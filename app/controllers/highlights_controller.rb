class HighlightsController < ApplicationController
  before_action :set_highlight, only: [:show, :update, :destroy]

  # GET /highlights
  def index
    @highlights = current_user.highlights
    render json: @highlights
  end

  def index_of_book
    book = current_user.books.find(params[:book_id])
    highlights = book.highlights
    render json: highlights
  end
  # GET /highlights/1
  def show
    render json: @highlight
  end

  # POST /highlights
  def create
    @highlight = Highlight.new(highlight_params)
    @highlight.user = current_user
    # Kiểm tra xem location đã tồn tại hay chưa
    @location = Location.find_or_initialize_by(page: location_params[:page], x: location_params[:x], y: location_params[:y],
      width: location_params[:width], height: location_params[:height])
    # @location.save
    # # Lưu location nếu chưa tồn tại
    if @location.new_record?
      @location.save
    end

    # Gán location_id cho highlight
    @highlight.location_id = @location.id

    if @highlight.save
      render json: @highlight, status: :created, location: @highlight
    else
      render json: @highlight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /highlights/1
  def update
    if @highlight.update(highlight_params)
      render json: @highlight
    else
      render json: @highlight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /highlights/1
  def destroy
    @highlight.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_highlight
    @highlight = current_user.highlights.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def highlight_params
    params.require(:highlight).permit( :book_id, :text, :location_id, location: [:page, :x, :y, :width, :height])
  end

  def location_params
    params.require(:location).permit(:page, :x, :y, :width, :height)
  end
end
