class SkillsController < ApplicationController
  def new 
    @skill = Skill.new
  end

  def create
    @skill = current_user.skills.create(name, description)
    @skill.save
    redirect_to skill
  end

<<<<<<< HEAD
=======

>>>>>>> userhomepage
  def index
    @skills = Skill.all
  end

  def show
<<<<<<< HEAD
    @skill = Skill.find(params[:id])
=======
   @skill = Skill.find(params[:id])
>>>>>>> userhomepage
  end
end
