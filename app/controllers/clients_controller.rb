class ClientsController < ApplicationController
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: { authToken: @client.auth_token }, status: :created
    else
      render json: { errors: @client.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def location
    @client = Client.find_by(auth_token: location_params[:auth_token])
    if @client
      @client.update(current_location: location_params[:current_location].to_json)
    else
      render status: :unauthorized
    end
  end

  private

  def location_params
    params.permit!
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email, :street_address, :city, :state, :zipcode, :phone_number, :password)
  end
end
