class ProviderServicesController < ApplicationController
  def create
    @provider = Provider.find_by(auth_token: request.headers["auth_token"])
    if @provider
      ProviderService.create_all_checked_services(@provider, provider_services_params)
      render status: :created
    else
      render status: :unauthorized
    end
  end

  private

  def provider_services_params
    params.permit!
  end
end
