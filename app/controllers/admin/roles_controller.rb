class Admin::RolesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @roles = Role.order(created_at: :desc).page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = "Thêm quyền thành công"
      redirect_to admin_roles_path
    else
      flash[:error] = @role.errors.full_messages[0].to_s
      render :new
    end
  end

  def update
    authorize! :update, @role
    if @role.update(role_params)
      flash[:success] = "Sửa quyền thành công"
      redirect_to admin_roles_path
    else
      flash[:error] = @role.errors.full_messages[0].to_s
      render :edit
    end
  end

  def edit
    @role = Role.find(params[:id])
    authorize! :update, @role
  end

  def destroy
    @role = Role.find(params[:id])
    authorize! :destroy, @role
    @role.destroy
    flash[:success] = "Xoá quyền thành công"
    redirect_to admin_roles_path
  end

  private

  def role_params
    params.require(:role).permit(:name, :description)
  end
end
