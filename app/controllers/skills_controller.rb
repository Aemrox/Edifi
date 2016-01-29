class SkillsController < ApplicationController
  def new
    @skill = Skill.new
  end

  def create
    @skill = current_user.skills.create(name, description)
    @skill.save
    redirect_to skill
  end
  
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end
end
