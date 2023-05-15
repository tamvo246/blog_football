class AddIntroToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :intro, :string
  end
end
