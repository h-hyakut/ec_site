class ProductsController < ApplicationController

  def index
    @books = Book.all
  end
 # GET /books/1 or /books/1.json
  def show
    @book = Book.find(params[:id])
  end
end
