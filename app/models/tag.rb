class Tag < ApplicationRecord
    has_many :taggings
    has_many :book, through: :taggings
end
