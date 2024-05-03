class Admin::DashboardController < ApplicationController
  before_action :check_if_admin

  def index; end

  private

  def check_if_admin
    redirect_to root_path if session[:user].nil? || !session[:user][:is_admin]
  end
end
