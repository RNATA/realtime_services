class ProviderServicesController < ApplicationController
  def create
    ProviderServicesController.create_all_checked_services(provider_services_params)
  end

  private

  def provider_services_params
    params.require(:auth_token).permit!
  end
end
