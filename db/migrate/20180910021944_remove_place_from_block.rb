class RemovePlaceFromBlock < ActiveRecord::Migration[5.1]
  def change
    remove_column :blocks, :place, :integer
  end
end
