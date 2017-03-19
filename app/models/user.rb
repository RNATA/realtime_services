class User

  def self.find_by_email(email)
    if User.client?(email)
      return Client.find_by(email: email)
    else
      return Provider.find_by(email: email)
    end
  end

  private

  def self.client?(email)
    Client.find_by(email: email) ? true : false
  end

end
