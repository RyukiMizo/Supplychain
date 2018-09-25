class DropTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :notices
    drop_table :notifications
  end
end
