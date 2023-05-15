class CreateAlbumImage < ActiveRecord::Migration[6.1]
  def change
    create_table :album_images do |t|
      t.string :image
      t.string :title

      t.timestamps
    end
  end
end
