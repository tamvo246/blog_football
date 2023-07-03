class Admin::BannersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @banners = Banner.order(created_at: :desc).page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @banner = Banner.new
  end

  def create
    @category = Banner.create(banner_params)
    redirect_to admin_banners_path
  end

  def update
    authorize! :update, @banner
    if @banner.update(banner_params)
      redirect_to admin_banners_path
    else
      render :edit
    end
  end

  def edit
    @banner = Banner.find(params[:id])
    authorize! :update, @banner
  end

  def destroy
    @banner = Banner.find(params[:id])
    authorize! :destroy, @banner
    @banner.destroy
    redirect_to admin_banners_path
  end

  private

  def banner_params
    params.require(:banner).permit(:title, :content, :image)
  end
end
