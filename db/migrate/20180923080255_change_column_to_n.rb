class ChangeColumnToN < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :notifications, :articles
    remove_reference :notifications, :article
  end
end
