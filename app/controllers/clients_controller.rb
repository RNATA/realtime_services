class ClientsController < ApplicationController
  def create
    @client = Client.new(client_params)
    if @client.save
      status 201
    else
      render json: { errors: @client.errors.full_messages }, status: :unauthorized
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email, :street_address, :city, :state, :zipcode, :phone_number, :password)
  end
end
