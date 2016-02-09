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
      puts request.env['omniauth.auth']
      @user = User.from_omniauth(request.env['omniauth.auth'])
      puts @user
      pust @user.id
      session[:user_id] = @user.id
      puts session[:user_id]
      puts current_user
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
     redirect_to homepage_path
  end
  

  def auth_failure
  redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out"
  end

end
