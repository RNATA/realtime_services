class ProviderService < ApplicationRecord
  belongs_to :service
  belongs_to :provider, inverse_of: :provider_services
  has_many :jobs

  def self.create_all_checked_services(provider, params)
    params[:services].each do |category, details|
      if details[:checked]
        ProviderService.create(
          base_rate: details[:base_rate],
          provider: provider,
          service: Service.find_by(category: category.to_s))
      end
    end
  end

end
