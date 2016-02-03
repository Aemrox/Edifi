class ConversationsController < ApplicationController

  before_filter :authenticate! 
  before_filter :authenticate_owner!, :only => :show

  def create
    
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to @conversation

  end

  def show
    @conversation = Conversation.find(params[:id])
    # @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  def authenticate_owner!
      @convo = Conversation.find(params[:id])
      if @convo.sender == current_user || @convo.recipient == current_user
      else 
       redirect_to homepage_path, notice: 'Thou Shalt Nought duuu dat :('
     end   
   
 end

  private
  def conversation_params
    params.require(:conversations).permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
