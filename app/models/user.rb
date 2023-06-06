class User < ApplicationRecord
  after_create :create_cart

  has_many :orders
  has_many :carts
  has_many :cart_items, through: :carts
  has_many :items, through: :cart_items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def create_cart
    self.carts.create!
  end
  
end
