class Admin::UsersController < ApplicationController
  before_action :check_if_admin
  before_action :set_user, only: %i[show edit delete]
  before_action :set_defaults

  def index
    @users = User.limit(@count).offset(@offset)
  end

  def show; end

  def create; end

  def edit; end

  def delete
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was deleted' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_defaults
    @count = params[:count] || 10
    @offset = params[:offset] || 0
  end

  def check_if_admin
    redirect_to root_path if session[:user].nil? || !session[:is_admin]
  end
end
