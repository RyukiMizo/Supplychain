class AddIndexToLikes < ActiveRecord::Migration[5.1]
  def change
    add_index :likes, :user_id
    add_index :likes, :micropost_id
    add_index :likes, [:user_id, :micropost_id], unique: true
    
  end
end
