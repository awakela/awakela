class User < ActiveRecord::Base
  def self.authenticate(login, password)
    user = self.find_by_username_and_password(login, password) 
    user = self.find_by_email_and_password(login, password) unless user
    return user
  end
end
