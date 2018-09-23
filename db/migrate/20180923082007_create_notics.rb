class CreateNotics < ActiveRecord::Migration[5.1]
  def change
      create_table :notics do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notified_by,index: true
      t.references :micropost,index: true, foreign_key: true
      t.string :notified_type
      t.boolean :read, default: false
      t.timestamps
    end
  add_foreign_key :notics, :users, column: :notified_by_id
    end
end
