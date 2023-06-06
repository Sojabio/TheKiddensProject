class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
    @cart = current_user.carts.first
    @cart_items = @cart.cart_items
    @total = @cart_items.sum {|cart_item| cart_item.item.price}
  end  
end