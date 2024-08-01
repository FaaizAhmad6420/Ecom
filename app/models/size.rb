class Size < ApplicationRecord
  include Ransackable
  
  has_many :product_sizes
  has_many :products, through: :product_sizes
  enum size: { small: 0, medium: 1, large: 2 }

  def display_name
    size.humanize
  end
end
