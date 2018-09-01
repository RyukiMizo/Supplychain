class AddAffiliationToIntroductions < ActiveRecord::Migration[5.1]
  def change
    add_column :introductions, :affilitation, :string
    add_column :introductions, :prefecture, :integer
    add_column :introductions, :site, :string
  end
end
