class Payment < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, :details, presence: true
end
