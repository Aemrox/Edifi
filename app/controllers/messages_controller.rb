class MessagesController < ApplicationController


  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
     @message = Message.new(message_params)
     if @message.save
        redirect_to @message
      else 
       redirect_to homepage_path, error: "Could not send your message"  
      end
  end
    




  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :receiver_id)
  end



end
