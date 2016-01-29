class ConnectionsController < ApplicationController
  def new
    @connection = Connection.new
  end

  def create
    binding.pry
    @connection = Connection.new(params)
    if @connection.save
        redirect_to root_path #something else with notice
    else  
        #puts failire notice
        redirect_to root_path
    end

  end

  def show
  end

end
