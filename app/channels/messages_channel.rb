class MessagesChannel < ApplicationCable::Channel
  def subscribed
     stream_from "room-#{params['room']}:messages"
  end

  def receive(payload)
    chat = Chat.find(params['room'])
    receiver = nil
    if current_user.id != chat.receiver_id
      receiver = chat.receiver_id
    else
      receiver = sender_id
    end

    Message.create!(user_id: current_user.id, chat_id: params["room"], body: payload["message"], sender_id: current_user.id, receiver_id: receiver)

  end

end
