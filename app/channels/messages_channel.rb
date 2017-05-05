class MessagesChannel < ApplicationCable::Channel
  def subscribed
     stream_from "room-#{params['room']}:messages"
  end

  def receive(payload)
    Message.create(user: current_user, chat_id: params["room"], body: payload["message"])
  end
 #  def send_message(data)
 #   current_user.messages.create!(body: data['message'], chat_room_id: data["chat_room_id"])
 # end
end
