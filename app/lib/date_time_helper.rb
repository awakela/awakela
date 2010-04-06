module DateTimeHelper
	# nicky time - absolute
	# like "4 o'clock", "ËÄµã°ë"
	def nicky_time_a(time)
		if time.is_a?(::Float) or time.is_a?(::Fixnum)
			time = 23.99 if time == 24
			time = Time.mktime(Time.now.year, Time.now.month, Time.now.day, time.to_int, ((0.0 + time - time.to_int) * 60).to_int, 0, 0)
		end
		time.strftime "%H:%M"
	end
	# nicky time - relative
	# like "1 minutes ago", "2 hours ago"
	def nicky_time_r(time)
		time.strftime "%H:%M"
	end
	# nicky day
	# like "3ÔÂ5ºÅ", "4ºÅ", "Last Fri", "Monday"
	def nicky_day(time)
		time.strftime "%m-%d"
	end
	
	def hours_in_day(time)
		time.hour + 1.0 * time.min / 60
	end
	module_function :nicky_time_a,
			:nicky_time_r,
			:nicky_day,
			:hours_in_day
end