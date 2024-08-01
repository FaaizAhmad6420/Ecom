class Category < ApplicationRecord
  include Ransackable
  
  has_many :products
  enum category: { male: 0, female: 1 }

  def display_name
    category.humanize
  end
end
