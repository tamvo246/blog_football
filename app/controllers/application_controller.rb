class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to forbidden_path
  end

  protected
  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation,:current_password,:email,:name, :phonenumber,:province,:city,:area,:idcardimg,:role) }
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :confirm_password, :role_id, :avatar, :name])
  end
end
