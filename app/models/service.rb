class Service < ApplicationRecord
  has_many :provider_services
  has_many :providers, through: :provider_services

  validates_uniqueness_of :provider
end
