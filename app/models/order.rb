class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy 
  has_many :books, through: :order_details

  def total_price
    order_details.sum { |order| order.total_price}
  end

  def total_number
    order_details.sum { |order| order.total_quantity}
  end
end
