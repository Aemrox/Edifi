class Rating < ActiveRecord::Base
  belongs_to :user

  def total_rating
        reviews = self.reviews
        review_sum = reviews.inject(0) { |sum, review| sum += review.rating }
        avg_rating = (review_sum / reviews.count).to_i unless review_sum == 0
        avg_rating
  end


end
