class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(counter, notification, message)
    ActionCable.server.broadcast 'notifications_channel',  counter: render_counter(counter), notification: render_notification(notification, message)
  end

  private

  def render_counter(counter)
    ApplicationController.renderer.render(partial: 'notifications/counter', locals: { counter: counter })
  end

  def render_notification(notification, message)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification, message: message })
  end
end
