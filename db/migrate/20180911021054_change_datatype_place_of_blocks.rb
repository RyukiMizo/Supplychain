class ChangeDatatypePlaceOfBlocks < ActiveRecord::Migration[5.1]
  def change
    change_column :blocks, :place, :text
  end
end
