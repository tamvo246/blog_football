class CreateTableCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.boolean :hide_status

      t.timestamps
    end
  end
end
