class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat


  def index

    @messages = @chat.messages
    @message = @chat.messages.new
    #
    # @array = []
    # rec_chat = Chat.all.where(receiver_id: current_user.id)
    # send_chat = Chat.all.where(sender_id: current_user.id)
    # if rec_chat.any? == true
    #   # binding.pry
    #   if rec_chat.first.receiver_id != current_user.id
    #     user = User.find(rec_chat.first.receiver_id)
    #     @array << user
    #   end
    #
    # elsif send_chat.any? == true
    #
    #   if send_chat.first.sender_id != current_user.id
    #     user = User.find(send_chat.first.sender_id)
    #     @array << user
    #   end
    # end
    # @array
    # @chat_receiver = @array.flatten
    # binding.pry
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
