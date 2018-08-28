class AddMicropostIdToBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :micropost_id, :integer
  end
end
