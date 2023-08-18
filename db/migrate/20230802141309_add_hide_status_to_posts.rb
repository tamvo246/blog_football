class AddHideStatusToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :hide_status, :boolean, default: false
  end
end
