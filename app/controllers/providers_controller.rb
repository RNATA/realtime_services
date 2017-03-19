class ProvidersController < ApplicationController
  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      render json: { authToken: @provider.auth_token }, status: :created
    else
      render json: { errors: @provider.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def provider_params
    params.require(:provider).permit(:first_name, :last_name, :email, :street_address, :city, :state, :zipcode, :phone_number, :password)
  end
end
