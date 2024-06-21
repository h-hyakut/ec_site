class LineItemsController < ApplicationController

  def create
    cart = current_cart
    book = Book.find(params[:book_id])
    @line_item = cart.add_product(book.id)

    if @book.sold_out?
      redirect_to product_path(@book)
      flash[:alert] = "This item is currently sold out and unavailable for purchase...🙇"
    else
      redirect_to products_path
      flash[:alert] = "Book ID is missing."
    return
    end
  end

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to products_path, notice: "Item was successfully added to your cart." }
      else
        format.html { redirect_to products_index_url, alert: "Unprocessable entity." }
      end
    end
  end

  # def show
  #   @cart= current_cart
  #   @line_item = @cart.line_item
  # end

  # private
  # def book_params
  #     params.require(:book).permit(:title, :author, :published_on, :showing, :price,  :status,: tag_ids [], :quantity)
  # end

  
end
