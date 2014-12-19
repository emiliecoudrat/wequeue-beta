class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  ###  POUR NE PAS ARRIVER DIRECTEMENT SUR LE SIGN IN
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:last_name, :first_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:last_name, :first_name, :email, :password, :password_confirmation, :current_password) }
  end

  def layout_by_resource
    if devise_controller? && action_name == "new"
      "sign"
    else
      "application"
    end
  end

end
