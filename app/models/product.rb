class Product < ApplicationRecord
  belongs_to :size
  belongs_to :category
  has_many :carts
  has_many :orders, through: :carts
end
