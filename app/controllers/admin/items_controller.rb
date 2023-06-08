class Admin::ItemsController < ApplicationController
  before_action :require_admin
  
  def index
    @items = Item.friendly.all
  end 

  def show
    @item = Item.find(params[:id])
  end

  def new 
    @item = Item.new
  end 

  def create
    @item = Item.new(item_params)
    @item.photo.attach(params[:item][:photo])
    if @item.save
      redirect_to @item, notice: "Le produit à été créé avec succès."
    else
      flash[:alert] = @item.errors.full_messages.join(", ")
      redirect_to new_admin_item_path
    end
  end 

  def edit
    @item = Item.find(params[:id])
  end 

  def update    
    if @item.update(item_params)
      if params[:item][:photo].present?
        @item.photo.attach(params[:item][:photo])
      end
      redirect_to admin_items_path, notice: 'Produit mis à jour avec succès.'
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end    
  end 

  def chabracadabra
    @item = Item.friendly.find(params[:id])
    @item.is_hidden = !@item.is_hidden
    @item.save
    redirect_to admin_items_path
  end

  
  private
  

  def require_admin
    unless current_user && current_user.is_admin?
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path
    end
  end
  
  def item_params
    params.require(:item).permit(:title, :description, :price, :photo)
  end
  
end
