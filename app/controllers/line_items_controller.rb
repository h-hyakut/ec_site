class LineItemsController < ApplicationController

  def create
    cart = current_cart
    book = Book.find(params[:book_id])
    
    if book.sold_out?
      redirect_to product_path(book)
      # flash[:alert] = "This item is currently sold out and unavailable for purchase...🙇"
    end
    
    @line_item = cart.add_product(book.id)

      respond_to do |format|
      if @line_item.save
        format.html { redirect_to products_path, notice: "Item was successfully added to your cart." }
      else
        format.html { redirect_to products_index_url, alert: "Unprocessable entity." }
      end
    end
  end
end
