class ProviderService < ApplicationRecord
  belongs_to :service
  belongs_to :provider, inverse_of: :provider_services
  has_many :jobs
end
