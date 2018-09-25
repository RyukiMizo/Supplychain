class AddFolowReferences < ActiveRecord::Migration[5.1]
  def change
    add_reference :notics, :relationship, foreign_key: true
  end
end
