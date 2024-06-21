class OrdersController < ApplicationController

  # def index
  #   @orders = Order.all 
  # end 注文一覧を作るときに使うよ

  def new
     @order = Order.new
     @books = @current_cart.books
  end

  
    
  def confirm
    @order = Order.new(order_params)
    # @book = Book.find(@order.book_id) #new アクションで設定された @book 変数
    @book = Book.find(order_params[:book_id]) #new アクションで設定された @book 変数
  
    if @book.sold_out?
      redirect_to product_path(@book)
      flash[:alert] = "This item is currently sold out and unavailable for purchase...🙇"
    end
  end

  def create
    @order = Order.new(order_params)
    @book = Book.find(order_params[:book_id])
    if @order.save
        @book.sold_out!
        redirect_to complete_orders_path
      else
        render "confirm"  # 注文が保存できなかった場合は確認画面を再表示
      end
    end


  def complete
    CompleteMailer.complete_mail(current_user).deliver
    
  end

  # order/new...book_id=1 で飛ぶときに　@bookをリンクに入れることで詳細画面に戻り、自然にページを移るようにできた
  private

  def order_params
    params.require(:order).permit(:count, :address, :book_id, :status, tag_ids:[])
  end
end