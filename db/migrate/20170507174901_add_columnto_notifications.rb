class AddColumntoNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :message_id, :integer
  end
end
