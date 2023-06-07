class User < ApplicationRecord
  after_create :create_cart
  after_create :welcome_send

  has_many :orders
  has_many :carts
  has_many :cart_items, through: :carts
  has_many :items, through: :cart_items

  extend FriendlyId
  friendly_id :email, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

def welcome_send
 UserMailer.welcome_email(self).deliver_now
end

private
  def create_cart
    self.carts.create!
  end

end
