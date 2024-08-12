class Customer < ApplicationRecord
  include Ransackable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many  :orders
  has_one_attached :avatar

  def current_order
    orders.find_or_create_by(status: 'cart')
  end
end
