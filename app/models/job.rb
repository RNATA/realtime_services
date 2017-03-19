class Job < ApplicationRecord
  belongs_to :provider_service
  belongs_to :client

  has_one :provider, through: :provider_service

  validates_associated :provider, :client

  def type
    provider_service.service.category
  end
end
