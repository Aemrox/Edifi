class LessonsController < ApplicationController

  def lesson_json
    id = pull_user_id_from_url
    @teacher = User.find(id)
    @lessons = @teacher.all_approved_lessons.map {|lesson| lesson.to_moment(current_user) if lesson}
    render json: @lessons
  end

  def render_options
    teacher_id = pull_user_id_from_url
    @connection = Connection.where("student_id = ?", current_user.id).where("teacher_id = ?", teacher_id).first
    @lessons = Scheduler.top_five_options(params, @connection)
    respond_to do |format|
      format.js{}
    end
  end

  def create
    binding.pry
  end

  private
  def pull_user_id_from_url
    url = @_request.env["HTTP_REFERER"]
    url.match(/users\/(\d)\//)[1]
  end

end
