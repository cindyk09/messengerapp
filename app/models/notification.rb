class Notification < ApplicationRecord
  belongs_to :message
  validates_presence_of :event, :message_id

  after_create_commit { NotificationBroadcastJob.perform_later(Notification.count,self)}
end
