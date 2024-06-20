class ProductsController < ApplicationController

  def index
    @books = Book.all
  end
 # GET /books/1 or /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  private
    # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author, :published_on, :showing, :price,  :status, tag_ids: [])
  end
end
