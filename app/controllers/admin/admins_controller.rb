class Admin::AdminsController < ApplicationController
  before_action :require_admin

  def show
    @user = current_user
  end 


  private

  def require_admin
    unless current_user && current_user.is_admin?
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path
    end
  end
end
