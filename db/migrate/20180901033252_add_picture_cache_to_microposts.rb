class AddPictureCacheToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :photo_cache, :string
    add_column :blocks, :picture_cache, :string
  end
end
