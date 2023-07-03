class AddFieldToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :opened_date, :datetime
    add_column :courses, :closed_date, :datetime
    add_column :courses, :course_age, :string
    add_column :courses, :target, :string
    add_column :courses, :course_details, :text
    add_column :courses, :cost, :string
  end
end
