class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.integer :place
      t.date :date
      t.text :information

      t.timestamps
    end
  end
end
