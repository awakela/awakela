module DateTimeHelper
	# nicky time - absolute
	# like "4 o'clock", "4点一刻"
	def nicky_time_a(time)
		if time.is_a?(::Float) or time.is_a?(::Fixnum)
			time = 23.99 if time == 24
			time = Time.mktime(Time.now.year, Time.now.month, Time.now.day, time.to_int, ((0.0 + time - time.to_int) * 60).to_int, 0, 0)
		end
		
		h = time.hour
		m = time.min
		if m > 57
			h = h + 1
			m_str = ""
		elsif m < 3
			m_str = ""
		elsif m > 12 and m < 18
			m_str = "一刻"
		elsif m > 27 and m < 33
			m_str = "半"
		elsif m > 42 and m < 48
			m_str = "三刻"
		else
			m_str = m.to_s + "分"
		end
		
		if h < 5
			h_str = "凌晨" + h.to_s
		elsif h > 12 and h < 6
			h_str = "下午" + (h - 12).to_s
		elsif h >= 18
			h_str = "晚上" + (h - 12).to_s
		else
			h_str = h.to_s
		end
		
		h_str + "点" + m_str
	end
	# nicky time - relative
	# like "1 minutes ago", "2 hours ago"
	def nicky_time_r(time)
		now = Time.zone.now
		time = time.in_time_zone
		
		
		post_fix = time > now ? "后" : "前"
		distance = [now, time].max - [now, time].min
		if distance > 8 * 24 * 3600
			return nicky_day(time) + " " + nicky_time_a(time)
		end
		
		
		
		if distance <= 60
			return "刚才"
		elsif distance > 60 and distance <= 3600
			n = distance / 60
			unit =  "分钟"
		elsif distance > 3600 and distance <= 24 * 3600
			n = distance / 3600
			unit =  "小时"
		else
			n = distance / 3600 / 24
			unit =  "天"
		end
		(n + 0.5).to_int.to_s + unit + post_fix
	end
	# nicky day
	# like "3月5号", "4月1号", "Last Fri", "Monday"
	def nicky_day(time)
		time.month.to_s + "月" + time.day.to_s + "号"
	end
	
	def hours_in_day(time)
		time.hour + 1.0 * time.min / 60
	end
	module_function :nicky_time_a,
			:nicky_time_r,
			:nicky_day,
			:hours_in_day
end