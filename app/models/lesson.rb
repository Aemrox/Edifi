class Lesson < ActiveRecord::Base
  belongs_to :connection
  # validate :no_schedule_conflict
  #
  # private
  # def no_schedule_conflict
  #   conflict = false
  #
  # end
end
