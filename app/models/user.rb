class User < ActiveRecord::Base
  has_many :wakeup_records

  def self.authenticate(login, password)
    user = self.find_by_username_and_password(login, password) 
    user = self.find_by_email_and_password(login, password) unless user
    return user
  end

  def recorded_today?
    WakeupRecord.recorded_today?(self)
  end
end
