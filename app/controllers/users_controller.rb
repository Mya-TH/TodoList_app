class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    message=""
    @user=User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]=" is successfully created. "
      redirect_to root_path
    else 
      flash[:alert] = "Error creating new user. Try again!!"
      redirect_to new_user_path
    end
  end
  def show
    @user=User.find(params[:id])
  end
  private def user_params
    params.require(:user).permit(:username,:password)
  end
end
