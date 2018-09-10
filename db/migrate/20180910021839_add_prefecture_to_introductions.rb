class AddPrefectureToIntroductions < ActiveRecord::Migration[5.1]
  def change
    add_column :introductions, :prefecture, :text
  end
end
