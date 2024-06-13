class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end
  def new
    @order = Order.new
    @book = Book.find(params[:id])
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        redirect_to order_path(@order), notice: "Your order has been completed.🛍★"
      else
        render :new
      end
    end
  end

  def confirm
    @books = Book.find(params[:id])
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:book_id, :quantity, :customer_name, :shipping_address)
  end
end
