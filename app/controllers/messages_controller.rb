class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def index
    @messages = @chat.messages
    @message = @chat.messages.new
  end

  def new
    @message = @chat.messages.new
  end

  def create
    message = @chat.messages.new(message_params)
    if message.save
      ActionCable.server.broadcast 'messages',
       message: message.body
       head :ok
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end
end
