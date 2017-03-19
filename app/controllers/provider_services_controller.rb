class ProviderServicesController < ApplicationController
  def create
    @provider_service = ProviderService.create_all_checked_services(provider_services_params)
    if @provider_service
      render json: { message: 'success' }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  private

  def provider_services_params
    params.require(:auth_token).permit!
  end
end
