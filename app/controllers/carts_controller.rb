class CartsController < ApplicationController
before_action :current_cart

  def show
    @line_items = @current_cart.line_items
  end
  
  def add_product(book_id)
    line_items.find_or_initialize_by(book_id: book_id)
  end

  def destroy
    session[:cart_id] = nil
    redirect_to products_path
  end
end
