class SessionsController < ApplicationController
  def create
    p params
    @client = Client.find_by(email: params[:email])
    if @client.authenticate(params[:password])
      render json: { authToken: @client.id }
    else
      render json: {}, status: :unauthorized
    end
  end
end
