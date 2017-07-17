class Product < ApplicationRecord
  has_many :order_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
