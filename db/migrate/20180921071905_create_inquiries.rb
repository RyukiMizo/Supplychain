class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.text :message
      t.string :email

      t.timestamps
    end
  end
end
