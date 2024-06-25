class Book < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    enum status: {on_sale: 1, sold_out: 2}

    has_many :line_items, dependent: :destroy

    has_many :order_details, dependent: :destroy 
    has_many :orders, through: :order_details

    has_one_attached :photo
    def thumbnail
        photo.variant(resize_to_fill: [150, 150])
      end
end
