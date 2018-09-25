class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_reference :notics, :like, foreign_key: true
  end
end
