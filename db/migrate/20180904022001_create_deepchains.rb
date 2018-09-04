class CreateDeepchains < ActiveRecord::Migration[5.1]
  def change
    create_table :deepchains do |t|
      t.date :date
      t.integer :place
      t.text :information
      t.string :chainpicture
      t.references :chain, foreign_key: true

      t.timestamps
    end
  end
end
