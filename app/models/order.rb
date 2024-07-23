class Order < ApplicationRecord
  belongs_to :user, class_name: 'Customer'
  belongs_to :payment
  has_many :carts, dependent: :destroy

  validates :order_date, :status, :total_amount, presence: true
end
