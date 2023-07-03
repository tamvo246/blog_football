class CreateCoachs < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|
      t.string :name
      t.datetime :birth_day
      t.string :address
      t.string :avatar
      t.text :achievements
      t.string :phone
      t.string :email

      t.timestamps
    end

    create_table :coaches_courses, id: false do |t|
      t.belongs_to :coach
      t.belongs_to :course
    end

    add_index :coaches_courses, [:coach_id, :course_id]
  end
end
