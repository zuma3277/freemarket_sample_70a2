class Product < ApplicationRecord
  enum dealing_status: { good: 0, normal: 1, bad: 2 }
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  belongs_to :shipment
  belongs_to :product_condition
  has_many :favorite_products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :product_imgs
end
