class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :books, through: :line_items

  def add_product(book_id)
    line_items.find_or_initialize_by(book_id: book_id)
  end

  def total_price
    line_items.to_a.sum {|item| item.item_total_price}
  end

  def total_number
    line_items.to_a.sum {|item| item.quantity}
  end
end

# through: :line_items は、中間テーブルとして LineItem を使用して Cart と Book を関連付けています。
# これにより、Cart インスタンスは、そのカート内のすべての Book レコードにアクセスできます。
# 具体的には、cart.books を使用して、特定のカートに関連付けられたすべての Book レコードを取得できます。

# ある本（Book）がカートに追加された回数を取得
# cart.books.find_by(title: 'Ruby Book').line_items.count