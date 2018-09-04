class AddPlaceToChain < ActiveRecord::Migration[5.1]
  def change
    add_column :chains, :place, :integer
    add_column :chains, :date, :date
    add_column :chains, :chainpicture, :string
  end
end
