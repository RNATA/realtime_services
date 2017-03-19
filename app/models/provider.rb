class Provider < ApplicationRecord
  has_many :provider_services, inverse_of: :provider
  has_many :services, through: :provider_services
  has_many :jobs, through: :provider_services
  has_many :clients_serviced, through: :jobs, source: :client

  validates_presence_of :email, :first_name, :last_name, :street_address, :city, :state, :zipcode, :phone_number
  validates_uniqueness_of :email
  validates_format_of :zipcode, :with => /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234"

  accepts_nested_attributes_for :provider_services

  has_secure_password

  after_create :set_auth_token

  def set_auth_token
    self.update(auth_token: generate_auth_token)
    self.save!
  end

  private

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
