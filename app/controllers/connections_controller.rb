class ConnectionsController < ApplicationController
  def new
    @connection = Connection.new
  end

  def create
    binding.pry
    @teacher = User.find(connection_params[:teacher_id])
    @connection = Connection.new(connection_params)
    @connection.save
    respond_to do |format|
      format.js{}
    end
    # if @connection.save
    #     redirect_to @teacher, notice: "Connection added!"
    #     #delete connection_request and display the student whos connection you added.
    # else
    #     #puts failire notice
    #     redirect_to @teacher, notice: "Unable to make connection! Try again."
    # end
  end

  def edit
  end

  def update
    @connection = Connection.find(params[:id])
    @connection.approved = true
    if @connection.save && @connection.student.teacher?
        Connection.create_reciprocal_connection(@connection)
    end
    redirect_to homepage_path
  end

  def show
  end

  private

  def connection_params
    params.require(:connections).permit(:teacher_id, :student_id, :approved)
  end

end
