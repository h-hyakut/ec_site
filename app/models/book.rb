class Book < ApplicationRecord
    has_many :taggings
    has_many :tags, through: :taggings

    enum status: {on_sale: 1, sold_out: 2}

    has_many :line_items, dependent: :destroy
end
