class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :size
end
