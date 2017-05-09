class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates_presence_of :body, :chat_id

  after_create_commit {MessageBroadcastJob.perform_now self}
  after_create_commit { notify }
  # after_create_commit if message is sent and not from current user = true/false

   def message_time
    time = created_at
    time.in_time_zone('Eastern Time (US & Canada)').strftime ("%m/%d/%y at %l:%M %p")
    # eventually change this method to get geolocator of the user and adjust to their time zone
   end

  private

  def notify
    binding.pry
    Notification.create(event: "New Notification (#{self.body})", message_id: self.id)
  end

  #  def unread_messages
  #    if @messages.last
  #      if @messages.last.user_id != current_user.id
  #        @messages.last.read = true;
  #      end
  #    end
  #  end

end
