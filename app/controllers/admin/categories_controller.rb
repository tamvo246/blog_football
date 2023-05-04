class Admin::CategoriesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @categories = Category.order(created_at: :desc).page(params[:page]).per(2)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path
  end

  def update
    authorize! :update, @category
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
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
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug)
  end
end
