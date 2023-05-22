class Admin::RolesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @roles = Role.order(created_at: :desc).page(params[:page]).per(2)
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.create(role_params)
    redirect_to admin_roles_path
  end

  def update
    authorize! :update, @role
    if @role.update(role_params)
      redirect_to admin_roles_path
    else
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
    redirect_to admin_roles_path
  end

  private

  def role_params
    params.require(:role).permit(:name, :description)
  end
end
