class Size < ApplicationRecord
  has_many :products
  enum size: { small: 0, medium: 1, large: 2 }
end
