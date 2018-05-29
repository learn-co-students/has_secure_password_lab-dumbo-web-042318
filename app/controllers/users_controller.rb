class UsersController < ApplicationController

  def welcome
    if session[:name] == nil 
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
  
      redirect_to root_path      
    else
      redirect_to new_user_path
    end

  end

  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

