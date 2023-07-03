class AddFieldToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :gradurated_date, :datetime
    add_column :students, :achievements, :text
  end
end
