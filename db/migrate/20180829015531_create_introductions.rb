class CreateIntroductions < ActiveRecord::Migration[5.1]
  def change
    create_table :introductions do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
