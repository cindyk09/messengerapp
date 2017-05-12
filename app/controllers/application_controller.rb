class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :notifications, if: :logged_in?
  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def notifications
    sql = "SELECT * FROM notifications INNER JOIN messages ON notifications.message_id = messages.id INNER JOIN chats ON chats.id = messages.chat_id WHERE chats.receiver_id = #{current_user.id} OR chats.sender_id = #{current_user.id}"
    @notifications = Notification.find_by_sql(sql)
    # @array = []
    # rec_chat = Chat.all.where(receiver_id: current_user.id)
    # send_chat = Chat.all.where(sender_id: current_user.id)
    # if rec_chat.any? == true
    #   messages = rec_chat.first.messages
    #   messages.each do |m|
    #     if m.user_id != current_user.id
    #       @array << m.notifications
    #     end
    #   end
    # elsif send_chat.any? == true
    #   messages = send_chat.first.messages
    #   messages.each do |m|
    #     if m.user_id != current_user.id
    #       @array << m.notifications
    #     end
    #   end
    # end
    # @array
    # @notifications = @array.flatten.reverse
  end


  private
  def authenticate
    redirect_to root_path unless current_user
  end


  # Redirecting sign_up path on devise
  def after_sign_in_path_for(resource_or_scope)
    chats_path
  end

  def after_update_path_for(resource)
   chats_path
  end
end
