class AlbumImagesController < ApplicationController
  def show
    @album_images = AlbumImage.all
  end
end
