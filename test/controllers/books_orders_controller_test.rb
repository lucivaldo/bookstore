require "test_helper"

class BooksOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @books_order = books_orders(:one)
  end

  test "should get index" do
    get books_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_books_order_url
    assert_response :success
  end

  test "should create books_order" do
    assert_difference("BooksOrder.count") do
      post books_orders_url, params: { books_order: { book_id: @books_order.book_id, order_id: @books_order.order_id } }
    end

    assert_redirected_to books_order_url(BooksOrder.last)
  end

  test "should show books_order" do
    get books_order_url(@books_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_books_order_url(@books_order)
    assert_response :success
  end

  test "should update books_order" do
    patch books_order_url(@books_order), params: { books_order: { book_id: @books_order.book_id, order_id: @books_order.order_id } }
    assert_redirected_to books_order_url(@books_order)
  end

  test "should destroy books_order" do
    assert_difference("BooksOrder.count", -1) do
      delete books_order_url(@books_order)
    end

    assert_redirected_to books_orders_url
  end
end
