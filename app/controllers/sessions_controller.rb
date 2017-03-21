class SessionsController < ApplicationController
  def create
    @user = User.find_by_phone_number(params[:phone_number])
    if @user.authenticate(params[:password])
      render json: { authToken: @user.auth_token, client: @user.is_a?(Client) }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
