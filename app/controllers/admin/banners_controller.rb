class Admin::BannersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @banners = Banner.order(created_at: :desc).page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      flash[:success] = "Thêm banner thành công"
      redirect_to admin_banners_path
    else
      flash[:error] = @banner.errors.full_messages[0].to_s
      render :new
    end

  end

  def update
    authorize! :update, @banner
    if @banner.update(banner_params)
      flash[:success] = "Sửa banner thành công"
      redirect_to admin_banners_path
    else
      flash[:error] = @about.errors.full_messages[0].to_s
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
    flash[:success] = "Xoá banner thành công"
    redirect_to admin_banners_path
  end

  private

  def banner_params
    params.require(:banner).permit(:title, :content, :image)
  end
end
