class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_numericality_of :quantity, greater_than: 0
end
