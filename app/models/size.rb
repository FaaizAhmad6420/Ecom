class Size < ApplicationRecord
  has_many :products, through: :product_sizes
  enum size: { small: 0, medium: 1, large: 2 }
end
