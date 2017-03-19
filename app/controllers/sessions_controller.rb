class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      render json: { authToken: @user.auth_token, client: @user.is_a?(Client) }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
