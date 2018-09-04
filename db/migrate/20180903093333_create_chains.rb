class CreateChains < ActiveRecord::Migration[5.1]
  def change
    create_table :chains do |t|
      t.text :information
      t.references :micropost, foreign_key: true

      t.timestamps
    end
  end
end
