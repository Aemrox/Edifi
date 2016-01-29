class SubjectsController < ApplicationController

  def new
  end

  def create

  end

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

end
