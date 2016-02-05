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
    @user = current_user
    @skill = Skill.new
    @pending_requests = current_user.connection_requested?

  end

  def teacherize
    @skill = Skill.new
    @user = current_user
  end

  def becometeacher
    current_user.skill_ids = new_teacher_params[:skill_ids]
    redirect_to homepage_path, notice: "New Skills Added!"
  end

  def calendar
    @teacher = User.find(params[:id])
    @user = @teacher
  end

  def set_availability
    @user = User.find(params[:id])
    params[:remove] ? availability = no_availability : availability = param_to_availability
    new_availability = Availability.set_array(@user.display_availability,availability)
    @user.set_availability(new_availability)
    @user.save
    respond_to do |format|
      format.js {render template: "users/availability/set_availability.js.erb",
                 layout: false}
    end
  end

  def rerender_availability
    respond_to do |format|
      format.js {render template: "users/availability/set_availability.js.erb",
                 layout: false}
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :attachment, :password, :password_confirmation, :bio, :first_name, :last_name)
  end

  def new_teacher_params
    params.require(:user).permit(:skill_ids => [])
  end

  def param_to_availability
    "#{params[:day]} #{params[:start_time]["time(4i)"]}:#{params[:start_time]["time(5i)"]} - #{params[:end_time]["time(4i)"]}:#{params[:end_time]["time(5i)"]}"
  end

  def no_availability
    "#{params[:day]} Not Available"
  end


end
