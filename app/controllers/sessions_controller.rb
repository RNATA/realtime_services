class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      render json: { authToken: @user.set_auth_token }
    else
      render json: {}, status: :unauthorized
    end
  end
end
