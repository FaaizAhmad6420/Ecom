class Product < ApplicationRecord
  has_many :carts, dependent: :destroy

  enum category: { male: 0, female: 1 }
  enum size: { small: 0, medium: 1, large: 2 }

  validates :name, :description, :price, :category, :size, presence: true
end
