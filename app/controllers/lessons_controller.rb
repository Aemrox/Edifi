class LessonsController < ApplicationController

  def lesson_json
    url = @_request.env["HTTP_REFERER"]
    id = url.match(/users\/(\d)\//)[1]
    @teacher = User.find(id)
    @lessons = @teacher.all_approved_lessons.map {|lesson| lesson.to_moment}
    # binding.pry
    render json: @lessons
  end

end
