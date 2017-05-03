class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: [:update, :destroy]

  def index
    @users = User.all
    @chats = Chat.all
  end

  def create
      if Chat.between(params[:sender_id], params[:receiver_id]).present?
        @chat = Chat.between(params[:sender_id], params[:receiver_id]).first
      else
        @chat = Chat.create(chat_params)
      end
    redirect_to chat_messages_path(@chat)
  end

  def update
  end

  def show
  end

  def destroy
    if @chat.present?
      @chat.destroy
    end
    redirect_to chats_path
  end

  private
  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.permit(:sender_id, :receiver_id)
  end
end
