class RemovePlaceFromDeepchains < ActiveRecord::Migration[5.1]
  def change
    remove_column :deepchains, :place, :integer
  end
end
