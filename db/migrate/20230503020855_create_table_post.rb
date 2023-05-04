class CreateTablePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
