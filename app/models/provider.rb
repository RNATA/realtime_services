class Provider < ApplicationRecord
  has_many :provider_services, inverse_of: :provider
  has_many :services, through: :provider_services
  has_many :jobs, through: :provider_services
  has_many :clients_serviced, through: :jobs, source: :client

  validates_presence_of :first_name, :phone_number
  validates_uniqueness_of :phone_number
  validates_format_of :zipcode, :with => /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234"

  has_secure_password

  after_create :set_auth_token

  def set_active(active_services)
    active_services.each do |service, active|
      s = Service.find_by(category: service)
      if active
        self.provider_services.find_by(service: s).update(active: true )
      end
    end
  end

  def active_services
    self.provider_services.select { |service| service.active }
  end

  def deactivate
    self.provider_services.each { |service| service.update(active: false) }
  end

  def self.find_active(coords, category)
    nearby_providers = Provider.where("lat < ? AND lat > ? AND long < ? AND long > ?", coords['lat'] + 0.4,coords['lat'] - 0.4, coords['long'] + 0.4, coords['long'] - 0.4)
    active_providers = nearby_providers.map {|provider| provider.provider_services.select {|service| (service.category == category) && (service.active) }}.flatten
    active_providers.map {|ps| {:id => ps.id, :name => ps.provider.first_name, :base_rate => ps.base_rate, :phone_number => ps.provider.phone_number, :company_name => ps.provider.company_name, :lat => ps.provider.lat, :long => ps.provider.long } }
  end

  def update_location(location_params)
    self.update(lat: location_params['lat'], long: location_params['long'])
    self.save!
  end

  def set_auth_token
    self.update(auth_token: generate_auth_token)
    self.save!
  end

  private

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
