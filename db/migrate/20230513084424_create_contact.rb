class CreateContact < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
