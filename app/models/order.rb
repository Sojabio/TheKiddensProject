class Order < ApplicationRecord
  after_create :order_confirmation_send

  belongs_to :user
  belongs_to :cart
  has_many :items, through: :cart

  def order_confirmation_send
    UserMailer.order_confirmation_email(self.user, self).deliver_now
  end
end
