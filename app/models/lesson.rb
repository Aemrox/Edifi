class Lesson < ActiveRecord::Base
  belongs_to :connection
  belongs_to :skill
  validate :no_schedule_conflict

  validates_presence_of :skill_id, :connection_id


  def date_range
    self.start_time..self.end_time
  end

  def chat_window
    (self.start_time - 10.minutes)..(self.end_time + 10.minutes)
  end

  def to_moment(current_user)
    json = {
      id: self.id,
      title: self.title(current_user),
      start: self.start_time,
      end: self.end_time,
      url: "/lessons/#{self.id}",
      overlap: false
    }
  end

  def now
    self.chat_window.cover?(Time.now)
  end

  def lesson_title
    "#{self.connection.teacher.user_name} teaching #{self.connection.student.user_name} #{self.skill.name}"
  end

  def title(current_user)
    if (current_user)
      if (current_user.id == self.connection.teacher.id || current_user.id == self.connection.student.id)
        lesson_title
      else
        "Booked Lesson"
      end
    else
        "Booked Lesson"
    end
  end

  def no_schedule_conflict
    check_schedule(:student) && check_schedule(:teacher)
  end



  def check_schedule(party)
    if party == :student
      all_lessons = self.connection.student.all_approved_lessons
    else
      all_lessons = self.connection.teacher.all_approved_lessons
    end
    all_lessons.each do |lesson|
      if (lesson && self.start_time.to_date == lesson.start_time.to_date)
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
