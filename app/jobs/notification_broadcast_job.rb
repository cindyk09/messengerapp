class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(counter,notification)
    binding.pry
    ActionCable.server.broadcast 'notifications_channel',  counter: render_counter(counter), notification: render_notification(notification)
  end

  private

  def render_counter(counter)
    binding.pry
    ApplicationController.renderer.render(partial: 'notifications/counter', locals: { counter: counter })
  end

  def render_notification(notification)
    binding.pry
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification })
  end
end
