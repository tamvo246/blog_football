class AlbumImagesController < ApplicationController
  def show
    @album_images = AlbumImage.order(created_at: :desc).page(params[:page]).per(9)
  end
end
