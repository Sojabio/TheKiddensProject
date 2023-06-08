class Admin::ItemsController < ApplicationController
  before_action :require_admin
  
  
  private
  
  def require_admin
    unless current_user && current_user.is_admin?
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path
    end
  end
  
end
