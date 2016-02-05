class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    user = User.authenticate!(params[:user_name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to homepage_path, notice: "You've been logged in"
      else
        # @user = User.new
        flash.now[:error] = "Bad username or password"
        render :new
      end
  end

  def omniauthcreate
  begin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.name}!"
  rescue
    flash[:warning] = "There was an error while trying to authenticate you..."
  end
  redirect_to root_path
end



  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out"
  end

end
