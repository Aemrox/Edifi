class Lesson < ActiveRecord::Base
  belongs_to :connection
  validate :no_schedule_conflict

  def date_range
    self.start_time..self.end_time
  end

  def no_schedule_conflict
    check_schedule(:student) && check_schedule(:teacher)
  end

  def check_schedule(party)
    if party == :student
      all_lessons = self.connection.student.lessons
    else
      all_lessons = self.connection.teacher.appointments
    end
    all_lessons.each do |lesson|
      if (self.start_time.to_date == lesson.start_time.to_date)
        range = lesson.date_range
        if (range.cover?(self.start_time))
          errors.add(:start_time, "this lesson conflicts with another lesson for this #{party}")
          return false
        end
        if (range.cover?(self.end_time))
          errors.add(:end_time, "this lesson conflicts with another lesson for this #{party}")
          return false
        end
      end
    end
    return true
  end
end
