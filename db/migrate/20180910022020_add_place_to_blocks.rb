class AddPlaceToBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :place, :text
  end
end
