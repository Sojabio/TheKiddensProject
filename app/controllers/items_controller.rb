class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def add_to_cart
        @item = Item.find(params[:id])
        if !current_user.carts
            current_user.carts.create!
        end
        @cart = current_user.carts
        @cart_items = current_user.carts.first.cart_items
       
        @cart_items.create!(item: @item)
        redirect_to root_path(success: true)
    end
end
