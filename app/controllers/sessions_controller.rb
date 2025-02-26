class SessionsController < ApplicationController
  def create
    @user=User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to todos_path
    else 
      message="Someting went wrong, Check the name and password again"
      redirect_to login_path, notice: message
    end
  end
  def destroy
    session[:user_id] = nil # Log out the user
    redirect_to login_path, notice: "Logged out successfully." # Redirect to login page
  end
end