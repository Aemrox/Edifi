class ConnectionsController < ApplicationController
  def new
    @connection = Connection.new
  end

  def create
    @teacher = User.find(connection_params[:teacher_id])
    @connection = Connection.new(connection_params)
    @connection.save
    UserMailer.message_email(@teacher).deliver_later

    respond_to do |format|
      format.js{}
    end
  end

  def edit
  end

  def update
    binding.pry
    @connection = Connection.find(params[:id])
    @connection.approved = true
    if @connection.save && @connection.student.teacher?
        Connection.create_reciprocal_connection(@connection)
    end
    respond_to do |format|
      format.js{}
    end
  end

  def destroy
    @connection = Connection.find(params[:id])
    @id = @connection.id
    @connection.destroy
    binding.pry
    respond_to do |format|
      format.js{}
    end
  end

  def show
  end

  private

  def connection_params
    params.require(:connections).permit(:teacher_id, :student_id, :approved)
  end

end
