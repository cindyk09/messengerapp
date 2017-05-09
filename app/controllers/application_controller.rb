class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notifications, if: :user_signed_in?

  protected
  def notifications
    @array = []
    rec_chat = Chat.all.where(receiver_id: current_user.id)
    send_chat = Chat.all.where(sender_id: current_user.id)
    if rec_chat.any? == true
      messages = rec_chat.first.messages
      messages.each do |m|
        if m.user_id != current_user.id
          @array << m.notifications
        end
      end
    elsif send_chat.any? == true
      messages = send_chat.first.messages
      messages.each do |m|
        if m.user_id != current_user.id
          @array << m.notifications
        end
      end
    end
    @array
    @notifications = @array.flatten
    # binding.pry
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation
      ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :current_password
      ])
  end

  # Redirecting sign_up path on devise
  def after_sign_in_path_for(resource_or_scope)
    chats_path
  end

  def after_update_path_for(resource)
   chats_path
  end
end
