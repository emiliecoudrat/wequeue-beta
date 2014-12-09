class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  ###  POUR NE PAS ARRIVER DIRECTEMENT SUR LE SIGN IN
  # before_action :authenticate_user!

  protect_from_forgery with: :exception
end
