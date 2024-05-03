class AuthController < ApplicationController
  before_action :check_if_not_logged_in, only: %i[show_login show_register login register]
  before_action :check_if_logged_in, only: %i[logout]

  def show_login; end

  def show_register; end

  def login
    found_user = User.find_by(username: user_params[:username])

    respond_to do |format|
      if found_user&.authenticate(user_params[:password])
        create_session(found_user)
        format.html { redirect_to root_path, notice: 'User logged in' }
      else
        @errors = found_user.errors.full_messages
        format.html do
          render :show_login, status: :unprocessable_entity, locals: { errors: @errors }
        end
      end
    end
  end

  def register
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @messages = ['User registered']
        format.html { redirect_to login_path, notice: 'New user registered' }
      else
        @errors = @user.errors.full_messages
        format.html { render :show_register, status: :unprocessable_entity }
      end
    end
  end

  def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to login_path, notice: 'New user registered' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def create_session(user)
    session[:user_id] = user.id
    session[:user] = user
  end

  def check_if_logged_in
    redirect_to root_path if session[:user].nil?
  end

  def check_if_not_logged_in
    redirect_to root_path unless session[:user].nil?
  end
end
