class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates_presence_of :body, :chat_id, :user_id

   def message_time
    time = created_at
    time.in_time_zone('Eastern Time (US & Canada)').strftime ("%m/%d/%y at %l:%M %p")
    # eventually change this method to get geolocator of the user and adjust to their time zone
   end

   def previous_10
     @messages
   end

   def unread_messages
     if @messages.last
       if @messages.last.user_id != current_user.id
         @messages.last.read = true;
       end
     end
   end

end
