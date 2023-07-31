class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @users = User.all.page(params[:page]).per(10).order("created_at desc")
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user
    @user.destroy
    flash[:success] = "Xoá tài khoản thành công"
    redirect_to admin_users_path
  end

  def update
    authorize! :update, @user
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      flash[:success] = "Sửa tài khoản thành công"
      redirect_to admin_users_path
    else
      flash[:error] = @user.errors.full_messages[0].to_s
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize! :update, @user
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :role_id, :password_confirmation, :avatar, :name)
  end
end
