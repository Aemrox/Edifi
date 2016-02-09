class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.create(rating_params)
     @rating.save
      respond_to do |format|
      format.html {redirect_to current_user}
      format.js { }
    end
      
  end

  def index
    @ratings = Rating.all
   
  end

  def show
    @rating = Rating.find(params[:id])
  end
  def rate
    @rating = Rating.find(params[:id])
    @rating.update_likes(current_user)
   
   end
  private

  def rating_params
    params.require(:rating).permit(:score)
  end

end
