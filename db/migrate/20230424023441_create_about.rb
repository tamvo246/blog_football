class CreateAbout < ActiveRecord::Migration[6.1]
  def change
    create_table :abouts do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.boolean :hide_status

      t.timestamps
    end
  end
end
