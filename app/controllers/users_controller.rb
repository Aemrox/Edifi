class UsersController < ApplicationController

  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up!"
    else
      render :new, notice: "failure!"
    end
  end
  
  def show
    
  end


  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :bio)
  end


end
