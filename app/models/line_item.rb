class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book

  def add_product(book_id)
    line_items.find_or_initialize_by(book_id: book_id)
  end

  def item_total_price
    book.price*quantity
  end
end
