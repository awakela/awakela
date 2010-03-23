class HomeController < ApplicationController
  def index
      @wakeup_record = WakeupRecord.new
	  @wakeup_records = WakeupRecord.all

		respond_to do |format|
		  format.html # new.html.erb
		  format.xml  { render :xml => @wakeup_record }
		end
  end

end
