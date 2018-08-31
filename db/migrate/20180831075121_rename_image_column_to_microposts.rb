class RenameImageColumnToMicroposts < ActiveRecord::Migration[5.1]
  def change
    rename_column :microposts, :image, :photo
  end
end
