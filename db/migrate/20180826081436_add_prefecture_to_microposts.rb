class AddPrefectureToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :prefecture, :integer
  end
end
