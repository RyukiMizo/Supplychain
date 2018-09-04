class RemoveDateFromChain < ActiveRecord::Migration[5.1]
  def change
    remove_column :chains, :date, :date
    remove_column :chains, :information, :text
    remove_column :chains, :place, :integer
    remove_column :chains, :chainpicture, :string
  end
end
