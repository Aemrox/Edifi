class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(comment_params)
    @comment.save
     respond_to do |format|
      format.js { }
    end
   end

  def index
    @comments = Comment.all
    respond_to do |format|
      format.html{}
      format.json{render json: @comments.map{|comment| comment.search_index_json}.compact.flatten}
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
