class Category < ApplicationRecord
  has_many :products
  enum category: { male: 0, female: 1 }
end
