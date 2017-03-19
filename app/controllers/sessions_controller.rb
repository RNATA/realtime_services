class SessionsController < ApplicationController
  def create
    @client = Client.find_by(email: params[:email])
    if @client.authenticate(params[:password])
      render json: { authToken: @client.set_auth_token }
    else
      render json: {}, status: :unauthorized
    end
  end
end
