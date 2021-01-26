class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
 
    if user = User.create(user_params)
      if user_params[:password] == user_params[:password_confirmation]
      session[:user_id] = user.id
      redirect_to '/' 
      else
        redirect_to new_users_path
      end
    else
      redirect_to new_users_path
    end
      
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end