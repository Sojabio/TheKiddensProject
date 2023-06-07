class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    unless current_user == @user
        redirect_to root_path(access_denied: true)
    end
  end
end
