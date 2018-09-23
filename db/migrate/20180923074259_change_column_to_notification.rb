class ChangeColumnToNotification < ActiveRecord::Migration[5.1]

  def up
    remove_column :notifications, :article_id
  end

  def down
    add_column :notifications, :article_id, :integer
  end

end
