class ProviderServicesController < ApplicationController
  def create
    @provider_service = ProviderService.new()
  end
end
