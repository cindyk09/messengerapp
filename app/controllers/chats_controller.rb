class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @chats = Chat.all
  end
  def create
      if Chat.between(params[:sender_id], params[:receiver_id]).present?
        @chat = Chat.between(params[:sender_id], params[:receiver_id]).first
      else
        binding.pry
        @chat.message.empty!
        @chat = Chat.create!(chat_params)
      end
    redirect_to chat_messages_path(@chat)
  end
  private

  def chat_params
    params.permit(:sender_id, :receiver_id)
  end
end
