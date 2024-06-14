class OrdersController < ApplicationController

  # def index
  #   @orders = Order.all 
  # end 注文一覧を作るときに使うよ

  def new
    @order = Order.new
    @book = Book.find(params[:book_id]) #idと関連をつける
  end

  def confirm
    @order = Order.new(order_params)
    # @book = Book.find(@order.book_id) #new アクションで設定された @book 変数
    @book = Book.find(order_params[:book_id]) #new アクションで設定された @book 変数
  end

  def create
    @order = Order.new(order_params)
      if @order.save
        redirect_to complete_orders_path(@order), notice: "Your order has been completed.🛍★"
      else
        render "confirm"
    end
  end


  def complete
  end

  private

  def order_params
    params.require(:order).permit(:count, :address, :book_id)
  end
end
