class WakeupRecord < ActiveRecord::Base
  belongs_to :user

  def self.todays_record(user)
    last = user.wakeup_records.last
	if !last.nil? and last.recorded_today?
		last
	else
		nil
	end
  end

  def recorded_today?
    self.time > DateTime.civil(DateTime.now.year,DateTime.now.month,DateTime.now.day)
  end
end
