class MessagesChannel < ApplicationCable::Channel
  def subscribed
     stream_from "room-#{params['room']}:messages"
  end

  def receive(payload)
    binding.pry
    Message.create(user: current_user, chat_id: params["room"], body: payload["message"], sender_id: params["sender_id"], receiver_id: ["receiver_id"])
  end

end
