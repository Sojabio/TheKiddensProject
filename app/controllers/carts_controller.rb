class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
    @user_cart = Cart.friendly.find(params[:id])
    @cart = current_user.carts.last
    unless @user_cart == @cart
      redirect_to root_path(access_denied: true)
    end
    @cart_items = @cart.cart_items
    @total = @cart_items.sum {|cart_item| cart_item.item.price}
  end
end
