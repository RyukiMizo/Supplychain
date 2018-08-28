class AddProductToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :product, :string
  end
end
