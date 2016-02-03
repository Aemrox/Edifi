class MessagesController < ApplicationController


  before_filter :authenticate!

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(user_id: params[:user_id], conversation_id: params[:conversation_id])
  end

  def create
    conversation = Conversation.find(params[:conversation_id])
    @message = conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save

    # redirect_to @conversation
    respond_to do |format|
      format.html {redirect_to conversation}
      format.js {}
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id)
  end

end
