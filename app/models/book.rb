class Book < ApplicationRecord
    has_many :taggings
    has_many :tag, through: :taggings
end
