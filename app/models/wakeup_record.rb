class WakeupRecord < ActiveRecord::Base
  belongs_to :user
  def self.create
    result = WakeupRecord.new
		result.time = DateTime.now.in_time_zone
		result.timezone = Time.zone.name
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
  
  def time_local
		self.time.in_time_zone self.timezone
  end
  
  def recorded_today?
		now = Time.zone.now
    self.time > Time.zone.local(now.year,now.month,now.day)
  end
  
end
