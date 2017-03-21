class Client < ApplicationRecord
  has_many :jobs
  has_many :providers_employed, through: :jobs, source: :provider

  validates_presence_of :first_name, :last_name, :phone_number
  validates_uniqueness_of :phone_number

  after_create :set_auth_token

  has_secure_password

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def address

  end

  def update_location(location_params)
    self.update(lat: location_params['lat'], long: location_params['long'])
    self.save!
  end

  def set_auth_token
    self.update(auth_token: generate_auth_token)
  end

  private

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
