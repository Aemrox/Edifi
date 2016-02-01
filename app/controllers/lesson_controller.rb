class LessonController < ApplicationController

  def lesson_json
    @lessons = User.first.all_lessons.map {|lesson| lesson.to_json}
    render json: @lessons
  end

end
