class AddCourseToContacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :contacts, :course, null: false, foreign_key: true
  end
end
