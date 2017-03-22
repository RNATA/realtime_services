class ProvidersController < ApplicationController
  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      render json: { authToken: @provider.auth_token, client: false }, status: :created
    else
      render json: { errors: @provider.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def profile
    @provider = Provider.find_by(auth_token: profile_params)
    if @provider
      render json: { companyName: @provider.company_name, fullName: @provider.full_name, message: "I'm watching you David" }, status: :ok
    else
      render :nothing => true, status: :unauthorized
    end
  end

  def info
    @provider = Provider.find_by(auth_token: info_params)
    if @provider
      render json: { services: @provider.services }, status: :ok
    else
      render :nothing => true, status: :unproccessable_entity
    end
  end

  def activate
    @provider = Provider.find_by(auth_token: activate_params[:auth_token])
    if @provider
      @provider.set_active(activate_params[:services])
    else
      render :nothing => true, status: :unauthorized
    end
  end

  def deactivate
    @provider = Provider.find_by(auth_token: deactivate_params)
    if @provider
      @provider.deactivate
    else
      render :nothing => true, status: :unauthorized
    end
  end

  def location
    @provider = Provider.find_by(auth_token: location_params[:auth_token])
    if @provider
      @provider.update_location(location_params[:current_location])
      @jobs = @provider.jobs.where(sent: false)
      if @jobs.any?
        @provider.deactivate
        @job = @jobs.first
        @job.update(sent: true)
        @job.save
        @client = @job.client
        render json: { job_type: @job.type, client_name: @client.full_name, client_location: @client.address, phone: @client.phone_number }
      else
        render :nothing => true, :status => 204
      end
    else
      render :nothing => true, status: :unauthorized
    end
  end

  private

  def profile_params
    params.require(:auth_token)
  end

  def deactivate_params
    params.require(:auth_token)
  end

  def location_params
    params.permit!
  end

  def activate_params
    params.permit!
  end

  def info_params
    params.require(:auth_token) unless params[:auth_token].nil?
  end

  def provider_params
    params.require(:provider).permit(:first_name, :last_name, :phone_number, :company_name, :password)
  end
end
