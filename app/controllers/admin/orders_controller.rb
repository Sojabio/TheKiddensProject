class Admin::OrdersController < ApplicationController
  before_action :require_admin
  
  def index
    @total_order = 0
    Order.all.each do |one_order|
      @total_order += one_order.cart.cart_items.sum {|cart_item| cart_item.item.price}
      end  
  end 

  private
  
  def require_admin
    unless current_user && current_user.is_admin?
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path
    end
  end
end
