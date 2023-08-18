class AddHideStatusToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :hide_status, :boolean, default: false
  end
end
