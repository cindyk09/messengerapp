class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'
  has_many :notifications, dependent: :destroy

  validates_presence_of :body, :chat_id, :sender_id, :receiver_id

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
    Notification.create(event: "#{self.body}", message_id: self.id)
  end


end
