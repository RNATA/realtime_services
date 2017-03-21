class User

  def self.find_by_phone_number(phone_number)
    if User.client?(phone_number)
      return Client.find_by(phone_number: phone_number)
    else
      return Provider.find_by(phone_number: phone_number)
    end
  end

  private

  def self.client?(phone_number)
    Client.find_by(phone_number: phone_number) ? true : false
  end

end
