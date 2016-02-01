class ConnectionsController < ApplicationController
  def new
    @connection = Connection.new
  end

  def create
    @connection = Connection.new(connection_params)
    if @connection.save
        redirect_to @user#something else with notice
    else  
        #puts failire notice
        redirect_to @user, notice: "Unable to make connection! Try again."
    end

  
  end

  def show
  end

  private

  def connection_params
    params.require(:connection).permit(:teacher_id, :student_id) 
  end

end
