class UsersController < ApplicationController

  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/homepage', notice: "Thank you for signing up!"
    else
      render :new, notice: "failure!"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def homepage

  end

  def update
    # binding.pry
    @user = User.find(params[:id])
    @user.skills_ids = new_teacher_params["teacher"]["skill_ids"]
  end

  def teacherize
    @skill = Skill.new
    @user = current_user
  end

  def connected?
    binding.pry
    Connection.all
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :bio, :first_name, :last_name)
  end

  def new_teacher_params
    params.require(:user).permit(:skill_ids => [])
  end


end
