class HomeController < ApplicationController
  def index
		@my_wakeup_record = WakeupRecord.create current_user_session.timezone
		@wakeup_records = WakeupRecord.find(
			:all,
			:order => "id desc",
			:limit => 10
		).reverse
		respond_to do |format|
		  format.html # new.html.erb
		  format.xml  { render :xml => @wakeup_record }
		end
  end

end
