class ConnectionRequestsController < ApplicationController

def new
    @connection = ConnectionRequest.new
  end

  def create
    @connection_request = ConnectionRequest.new(connection_request_params)
     #can't send your self a request.
    if @connection_request.save
        redirect_to current_user
        #something else with notice
    else  
        #puts failire notice
        redirect_to @user, notice: "Unable to make connection_request! Try again."
    end

  
  end

  def show
  end

  private

  def connection_request_params

    params.require(:connection_requests).permit(:teacher_id, :student_id) 
  end

end
