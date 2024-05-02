class Admin::UsersController < ApplicationController
  def index
    @users = User.take(10)
  end

  def show
  end

  def create
  end

  def edit
  end

  def delete
  end
end
