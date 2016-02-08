class HomeController < ApplicationController
  def index
    @user= User.new
    @subjects = Subject.all
  end
end
