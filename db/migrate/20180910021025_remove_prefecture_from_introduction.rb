class RemovePrefectureFromIntroduction < ActiveRecord::Migration[5.1]
  def change
    remove_column :introductions, :prefecture, :integer
  end
end
