class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :title, :description, :price, presence: true

  validates :title, uniqueness: true

  validates :price, numericality: { greater_than: 0 }

  #rajouter les images en obligatoire dans la validation



end
