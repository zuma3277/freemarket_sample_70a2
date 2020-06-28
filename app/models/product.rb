class Product < ApplicationRecord
  enum dealing_status: { good: 0, normal: 1, bad: 2 }
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  belongs_to :shipment
  belong_to :product_condition
  has_many :favorite_products dependent: :destroy
  has_many :comments dependent: :destory
  has_many :product_imgs
end
