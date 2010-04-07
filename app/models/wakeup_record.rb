class WakeupRecord < ActiveRecord::Base
  belongs_to :user
  def self.create(timezone_str)  
    result = WakeupRecord.new
		utc = DateTime.now.new_offset(0)
    tz = ActiveSupport::TimeZone.new timezone_str
		result.timezone = timezone_str
		result.time = tz.utc_to_local utc
		result
  end
  
  def self.todays_record(user)
    last = user.wakeup_records.last
		if !last.nil? and last.recorded_today?
			last
		else
			nil
		end
  end

  def tz
		tz_str = self.timezone
		if tz_str.nil? or tz_str.empty?
			tz_str = 'UTC'
		end

		ActiveSupport::TimeZone.new tz_str
  end
  
  def time_local
		self.tz.utc_to_local self.time
  end
  
  def recorded_today?
		now = UserSession.current.tz.now
    self.time > self.tz.local(now.year,now.month,now.day)
  end
  
end
