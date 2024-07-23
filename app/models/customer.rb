class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :username, :password, :email, presence: true
end
