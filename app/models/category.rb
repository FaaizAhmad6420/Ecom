class Category < ApplicationRecord
  has_many :products
  enum category: { male: 0, female: 1 }

  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "id", "id_value", "updated_at"]
  end

  def display_name
    category.humanize
  end
end
