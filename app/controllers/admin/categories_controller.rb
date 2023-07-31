class Admin::CategoriesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @categories = Category.order(created_at: :desc).page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Thêm thể loại thành công"
      redirect_to admin_categories_path
    else
      flash[:error] = @category.errors.full_messages[0].to_s
      render :new
    end

  end

  def update
    authorize! :update, @category
    if @category.update(category_params)
      flash[:success] = "Sửa thể loại thành công"
      redirect_to admin_categories_path
    else
      flash[:error] = @category.errors.full_messages[0].to_s
      render :edit
    end
  end

  def edit
    @category = Category.find(params[:id])
    authorize! :update, @category
  end

  def destroy
    @category = Category.find(params[:id])
    authorize! :destroy, @category
    @category.destroy
    flash[:success] = "Xoá thể loại thành công"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug)
  end
end
