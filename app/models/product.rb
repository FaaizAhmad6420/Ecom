class Product < ApplicationRecord
  belongs_to :category
  has_many :carts
  has_many :orders, through: :carts
  has_many :sizes, through: :product_sizes
end
