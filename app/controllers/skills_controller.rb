class SkillsController < ApplicationController
  def new
  end

  def create

  end

  def index
    @skills = Skill.all
  end

  def show

  end
end
