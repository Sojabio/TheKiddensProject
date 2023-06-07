class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  extend FriendlyId
  friendly_id :sluga, use: :slugged

  def sluga
    ["mon-panier"]
  end
end
