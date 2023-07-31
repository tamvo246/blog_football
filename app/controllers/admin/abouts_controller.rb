class Admin::AboutsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @abouts = About.page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @about = About.new
  end

  def create
    @about = About.create(about_params)
    redirect_to admin_abouts_path
  end

  def update
    authorize! :update, @about
    if @about.update(about_params)
      flash[:success] = "Sửa giới thiệu thành công"
      redirect_to admin_abouts_path
    else
      flash[:error] = @about.errors.full_messages[0].to_s
      render :edit
    end
  end

  def edit
    @about = About.find(params[:id])
    authorize! :update, @about
  end

  def destroy
    @about = About.find(params[:id])
    authorize! :destroy, @about
    @about.destroy
    redirect_to admin_abouts_path
  end

  private

  def about_params
    params.require(:about).permit(:title, :content, :slug, :intro, :image_intro)
  end
end
