class AddMicropostIdToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_reference :notifications, :micropost, foreign_key: true
  end
end
