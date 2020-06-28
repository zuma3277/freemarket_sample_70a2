class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :credit_card, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :destination, dependent: :destroy
  has_many :favorite_products, dependent: :destroy
  has_many :products, dependent: :destroy
end
