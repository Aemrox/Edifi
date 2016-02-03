class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate!, :authenticate_owner!

  def current_user
    # binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    redirect_to login_path, notice: "You need to be logged in to do that!" unless logged_in?
  end



  # def authenticate_owner!
  #  binding.pry
  #    if !!Conversation.find(params[:id]) 
  #         @current_conversation = Conversation.find(params[:id]) 
  #         redirect_to homepage_path unless current_user.conversations.include?(@current_conversation) 
  #   else 
  #         @conversation = Conversation.create!(conversation_params)
  #   end

  # end 

end
