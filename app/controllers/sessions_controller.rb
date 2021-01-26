class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.find_by(name: session_params[:name]) 
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to new_sessions_path
    end
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end
  
end


# post '/login' do
#   user = User.find_by(:username => params[:username])
#   if user && user.authenticate(params[:password])
#     session[:user_id] = user.id
#     redirect "/home"
#   else
#     redirect "/error/wrong user name or password"
#   end
# end