class AddQrToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :qrcount, :integer
  end
end
