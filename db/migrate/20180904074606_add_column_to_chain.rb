class AddColumnToChain < ActiveRecord::Migration[5.1]
  def change
    add_column :chains, :user_id, :string, foreign_key: true
  end
end
