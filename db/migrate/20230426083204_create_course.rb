class CreateCourse < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
