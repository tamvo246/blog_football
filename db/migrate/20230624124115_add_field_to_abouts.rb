class AddFieldToAbouts < ActiveRecord::Migration[6.1]
  def change
    add_column :abouts, :intro, :string
    add_column :abouts, :image_intro, :string
  end
end
