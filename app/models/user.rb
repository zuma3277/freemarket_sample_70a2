class User < ApplicationRecord

  has_one :credit_card  dependent: :destroy
  has_one :profile  dependent: :destroy
  has_one :address  dependent: :destroy
  has_many :comments   dependent: :destory
  has_one :destination  dependent: :destory
  has_many :favorite_products dependent: :destroy
  has_many :products dependent: :destroy
  
end
