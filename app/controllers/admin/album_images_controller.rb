class Admin::AlbumImagesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @album_images = AlbumImage.order(created_at: :desc).page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @album_image = AlbumImage.new
  end

  def create
    authorize! :create, @album_image
    @album_image = AlbumImage.new(album_image_params)
    @album_image.save
    redirect_to admin_album_images_path
  end

  def update
    authorize! :update, @album_image
    if @album_image.update(album_image_params)
      redirect_to admin_album_images_path
    else
      render :edit
    end
  end

  def edit
    @album_image = AlbumImage.find(params[:id])
    authorize! :update, @album_image
  end

  def destroy
    @album_image = AlbumImage.find(params[:id])
    authorize! :destroy, @album_image
    @album_image.destroy
    redirect_to admin_album_image_path
  end

  private

  def album_image_params
    params.require(:album_image).permit(:title, :image)
  end
end
