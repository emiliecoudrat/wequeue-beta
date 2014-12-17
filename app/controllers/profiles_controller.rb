class ProfilesController < ApplicationController
    helper_method :resource, :resource_name, :devise_mapping
    before_action :set_user, only: [:edit, :update, :edit_pwd, :update_pwd]

  def show
    @user = current_user
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to profile_path
  end

  def edit_pwd

  end

  def update_pwd
    @user.update(user_params)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :picture, :email, :password, :password_confirmation, :current_password)
    end

    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
end
