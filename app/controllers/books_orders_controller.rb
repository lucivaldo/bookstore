class BooksOrdersController < ApplicationController
  before_action :set_books_order, only: %i[ show edit update destroy ]

  # GET /books_orders
  def index
    @books_orders = BooksOrder.all
  end

  # GET /books_orders/1
  def show
  end

  # GET /books_orders/new
  def new
    @books_order = BooksOrder.new
  end

  # GET /books_orders/1/edit
  def edit
  end

  # POST /books_orders
  def create
    @books_order = BooksOrder.new(books_order_params)

    if @books_order.save
      redirect_to @books_order, notice: "Books order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books_orders/1
  def update
    if @books_order.update(books_order_params)
      redirect_to @books_order, notice: "Books order was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books_orders/1
  def destroy
    @books_order.destroy!
    redirect_to books_orders_url, notice: "Books order was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_books_order
      @books_order = BooksOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def books_order_params
      params.require(:books_order).permit(:order_id, :book_id)
    end
end
