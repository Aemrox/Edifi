class SkillsController < ApplicationController
  def new
    @skill = Skill.new
  end

  def create
    skill = current_user.skills.create(skill_params)
    Skill.reindex if skill.save
    respond_to do |format|
      format.js{}
    end
  end

  def index
    @skills = Skill.all
    respond_to do |format|
      format.html{}
      format.json{render json: @skills.map{|skill| skill.search_index_json}.compact.flatten}
    end
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def search
    @skills = Skill.search(params[:query]).map {|result| result}
    @query = params[:query]
  end



  private
  def skill_params
    params.require(:skill).permit(:name, :description, :subject_id)
  end
end
