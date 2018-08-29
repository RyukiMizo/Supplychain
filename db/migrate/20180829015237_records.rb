class Records < ActiveRecord::Migration[5.1]
  def change
    drop_table :introductions
  end
end
