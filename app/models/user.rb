class User < ActiveRecord::Base
  has_many :wakeup_records

  def self.authenticate(login, password)
    user = self.find_by_username_and_password(login, password) 
    user = self.find_by_email_and_password(login, password) unless user
    return user
  end

  def todays_record
    WakeupRecord.todays_record(self)
  end
  
  def to_s
    self.username
  end
end
