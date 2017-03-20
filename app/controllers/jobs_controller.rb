class JobsController < ApplicationController
  def create
    @client = Client.find_by(auth_token: job_params[:auth_token])
    if @client
      Job.create!(provider_service_id: job_params[:provider_service_id], client: @client)
      render json: { message: ProviderService.find(job_params[:provider_service_id]).provider.first_name }
    else
      render status: :unauthorized
    end
  end

  private

  def job_params
    params.require(:job).permit(:provider_service_id, :auth_token)
  end
end
