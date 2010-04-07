class UserSession
	def self.create(user, client_timezone)
		@@current = UserSession.new(user, client_timezone)
	end
	
	
	def self.current
		@@current
	end
	
	def user
		@user
	end
	
  def timezone
		client_timezone or server_timezone
  end
  
  def server_timezone
		(defined? config) and config.time_zone or 'UTC'
  end

  def client_timezone
		@client_timezone
  end
		
	def tz
		ActiveSupport::TimeZone.new timezone
	end
	
private
	def initialize(user, client_timezone)
		@client_timezone = client_timezone
		@user = user
	end
end