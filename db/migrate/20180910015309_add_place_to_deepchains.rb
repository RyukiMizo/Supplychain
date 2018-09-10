class AddPlaceToDeepchains < ActiveRecord::Migration[5.1]
  def change
    add_column :deepchains, :place, :text
  end
end
