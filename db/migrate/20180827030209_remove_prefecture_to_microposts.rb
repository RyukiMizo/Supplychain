class RemovePrefectureToMicroposts < ActiveRecord::Migration[5.1]
  def change
    remove_column :microposts, :prefecture, :string
  end
end
