class Size < ApplicationRecord
  has_many :product_sizes
  has_many :products, through: :product_sizes
  enum size: { small: 0, medium: 1, large: 2 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "size", "updated_at"]
  end

  def display_name
    size.humanize
  end
end
