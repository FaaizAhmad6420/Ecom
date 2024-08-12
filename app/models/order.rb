class Order < ApplicationRecord
  belongs_to :customer
  has_one :payment
  has_many :carts
  has_many :products, through: :carts

  enum status: { cart: 'cart', completed: 'completed' }
end
