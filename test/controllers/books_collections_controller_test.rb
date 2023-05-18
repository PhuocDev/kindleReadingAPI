require "test_helper"

class BooksCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @books_collection = books_collections(:one)
  end

  test "should get index" do
    get books_collections_url, as: :json
    assert_response :success
  end

  test "should create books_collection" do
    assert_difference("BooksCollection.count") do
      post books_collections_url, params: { books_collection: { book_id: @books_collection.book_id, collection_id: @books_collection.collection_id } }, as: :json
    end

    assert_response :created
  end

  test "should show books_collection" do
    get books_collection_url(@books_collection), as: :json
    assert_response :success
  end

  test "should update books_collection" do
    patch books_collection_url(@books_collection), params: { books_collection: { book_id: @books_collection.book_id, collection_id: @books_collection.collection_id } }, as: :json
    assert_response :success
  end

  test "should destroy books_collection" do
    assert_difference("BooksCollection.count", -1) do
      delete books_collection_url(@books_collection), as: :json
    end

    assert_response :no_content
  end
end
