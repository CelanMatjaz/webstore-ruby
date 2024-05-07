class Account::SettingsController < ApplicationController
  def show
    @account_settings = AccountSettings.find_by(user_id: session[:user_id])
  end

  def edit
    # Settings SHOULD ALWAYS exist
    user = User.find_by(id: session[:user_id])
    @account_settings = user.account_settings

    respond_to do |format|
      if @account_settings.update(update_params)
        session[:username] = @account_settings.display_name
        session[:currency] = @account_settings.currency
        format.html do
          redirect_to account_settings_path, notice: 'Settings succesfully saved!'
        end
      else
        @errors = @account_settings.errors.full_messages
        format.html { render :show, status: :unprocessable_entity }
      end
    end
  end

  private

  def update_params
    params.require(:account_settings).permit(:display_name, :currency)
  end
end
