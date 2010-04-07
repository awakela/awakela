class User < ActiveRecord::Base
  acts_as_network :friends, :through => :invites, :conditions => ["is_accepted = ?", true]
  has_many :wakeup_records

  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email, :if => Proc.new { |record| record.new_record? }

  def self.authenticate(login, password)
    user = self.find_by_username_and_password(login, password) 
    user = self.find_by_email_and_password(login, password) unless user
    return user
  end

  def todays_wakeup_record
		return @todays_wakeup_record if @todays_wakeup_record_fetched
		@todays_wakeup_record_fetched = true
    @todays_wakeup_record = WakeupRecord.todays_record(self)
  end
  
  def to_s
    self.username
  end
	
end
