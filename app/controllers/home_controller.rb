class HomeController < ApplicationController
  def index
      @my_wakeup_record = WakeupRecord.create current_timezone
	  @wakeup_records = WakeupRecord.all

		respond_to do |format|
		  format.html # new.html.erb
		  format.xml  { render :xml => @wakeup_record }
		end
  end

end
