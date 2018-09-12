class ChangeDatatypePrefectureOfIntroductions < ActiveRecord::Migration[5.1]
  def change
    change_column :introductions, :prefecture, :text
  end
end
