class AddPictureToBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :picture, :string
  end
end
