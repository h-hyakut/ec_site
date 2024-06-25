class OrdersController < ApplicationController

  def new
     @order = Order.new
     @books = @current_cart.books

     sold_out_books = @current_cart.books.where(status: :sold_out)
    if sold_out_books.exists?
      redirect_to products_path
      return
    end
  end
    
  def confirm
    @count = order_params[:count]
    @order = Order.new(order_params)
    # @book = Book.find(@order.book_id) #new アクションで設定された @book 変数
    @books = Book.where(id: order_params[:book_ids]) #new アクションで設定された @book 変数
    @line_items = @current_cart.line_items

    order_params[:count].each_with_index do |count, index|
    book_id = order_params[:book_ids][index]
    line_item = @line_items.find_by(book_id: book_id)
  
      if line_item.present?
        line_item.update(quantity: count)
      end
    end
  end

  #   @books.each do |book|
  #     if book.sold_out?
  #       redirect_to product_path(book)
  #       flash[:alert] = "This item is currently sold out and unavailable for purchase...🙇"
  #     return
  #     end
  #   end
  # end

  def create
    count = order_params[:count].map(&:to_i).sum
    @order = Order.new(address: order_params[:address], count: count)
    @books = Book.where(id: order_params[:book_ids])
    @line_items = @current_cart.line_items

    if @order.save
      OrderDetail.create_items(@order, @line_items)
      
      @line_items.each do |item|
        item.book.sold_out!
      end
        redirect_to complete_orders_path(@order), notice: "Order was successfully placed!"
    else
      render "confirm"
    end
  end


  def complete
    @orders = Order.where(id: params[:id])
    CompleteMailer.complete_mail(current_user).deliver
  end

  # order/new...book_id=1 で飛ぶときに　@bookをリンクに入れることで詳細画面に戻り、自然にページを移るようにできた
  private

  def order_params
    params.require(:order).permit(:status, :address, count: [], book_ids: [])
  end
end