class AlbumImage < ApplicationRecord
  mount_uploader :image, ImageUploader
end
