class Client < ApplicationRecord
  has_many :jobs
  has_many :providers_employed, through: :jobs, source: :provider

  validates_presence_of :email, :first_name, :last_name, :street_address, :city, :state, :zipcode, :phone_number
  validates_uniqueness_of :email
  validates_format_of :zipcode, with: /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234"

  after_create :set_auth_token

  has_secure_password

  def set_auth_token
    self.update(auth_token: generate_auth_token)
  end

  private

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
