class ClientsController < ApplicationController
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: { authToken: @client.auth_token, client: true }, status: :created
    else
      render json: { errors: @client.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def location
    @client = Client.find_by(auth_token: location_params[:auth_token])
    if @client
      @client.update_location(location_params[:coords])
      render json: { providers: Provider.find_active(location_params[:coords], location_params[:category]) }
    else
      render :nothing => true, status: :unauthorized
    end
  end

  def address
    @client = Client.find_by(auth_token: address_params[:auth_token])
    if @client
      @client.update(address: address_params[:address])
      render json: { message: 'success' }, status: :ok
    else
      render status: :unproccessable_entity
    end
  end

  private

  def address_params
    params.require(:client).permit(:auth_token, :address)
  end

  def location_params
    params.permit!
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number, :password)
  end
end
