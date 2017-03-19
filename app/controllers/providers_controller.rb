class ProvidersController < ApplicationController
  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      render json: { authToken: @provider.auth_token }, status: :created
    else
      render json: { errors: @provider.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def info
    @provider = Provider.find_by(auth_token: info_params)
    if @provider
      render json: { services: @provider.services }, status: :ok
    else
      render status: :unproccessable_entity
    end
  end

  def activate
    @provider = Provider.find_by(auth_token: activate_params[:auth_token])
    if @provider
      @provider.set_active(activate_params[:services])
    else
      render status: :unauthorized
    end
  end

  private

  def activate_params
    params.permit!
  end

  def info_params
    params.require(:auth_token) unless params[:auth_token].nil?
  end

  def provider_params
    params.require(:provider).permit(:first_name, :last_name, :email, :street_address, :city, :state, :zipcode, :phone_number, :password)
  end
end
