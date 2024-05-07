class Account::AddressController < ApplicationController
  def show
    @user = User.find_by(id: session[:user_id])
  end

  def show_create; end

  def show_update
    @address = Address.find_by(id: id_param)

    return if @address

    render 'layouts/http_error', locals: { error: { code: 404, message: 'Address does not exist.' } }
  end

  def create
    @user = User.find_by(id: session[:user_id])

    address = @user.addresses.new(new_params)

    respond_to do |format|
      if @user.addresses.count >= 5
        format.html { redirect_to account_addresses_path, alert: 'Cannot have more than 5 addresses' }
      elsif address.save
        format.html { redirect_to account_addresses_path }
      else
        @errors = address.errors.full_messages
        @address = address
        format.html do
          render :show_create, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    user = User.find_by(id: session[:user_id])
    @address = user.addresses.find_by(id: id_param)

    respond_to do |format|
      if @address.update(update_params)
        format.html do
          redirect_to account_addresses_path, notice: 'Address succesfully saved!'
        end
      else
        @errors = @account_settings.errors.full_messages
        format.html { render :show_update, status: :unprocessable_entity }
      end
    end
  end

  def delete
    user = User.find_by(id: session[:user_id])
    @address = user.addresses.find_by(id: id_param)&.destroy
    redirect_to account_addresses_path, notice: 'Address succesfully deleted!'
  end

  private

  def new_params
    params.require(:address).permit(:country, :city, :zip_code, :street, :house_number)
  end

  def update_params
    params.require(:address).permit(:country, :city, :zip_code, :street, :house_number)
  end

  def id_param
    params.require(:id)
  end
end
