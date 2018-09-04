class AddContactToChain < ActiveRecord::Migration[5.1]
  def change
    add_column :chains, :contact, :text
  end
end
