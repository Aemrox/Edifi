class ConnectionsController < ApplicationController
  def new
    @connection = Connection.new
  end

  def create
    @connection = Connection.new(connection_params)
    if @connection.save
        redirect_to current_user, notice: "Connection added!"
        #delete connection_request and display the student whos connection you added.
    else  
        #puts failire notice
        redirect_to current_user, notice: "Unable to make connection! Try again."
    end
  end

  def edit
  end

  def update
    @connection = Connection.find(params[:id])
    @connection.approved = true
    @connection.save
    redirect_to homepage_path
  end

  def show
  end

  private

  def connection_params
    params.require(:connections).permit(:teacher_id, :student_id, :approved) 
  end

end
