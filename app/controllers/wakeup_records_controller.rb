class WakeupRecordsController < ApplicationController
  before_filter :login_required

  # POST /wakeup_records
  # POST /wakeup_records.xml
  def create
    @wakeup_record = WakeupRecord.new(params[:wakeup_record])
		@wakeup_record.user = @current_user
		@wakeup_record.timezone = Time.zone.name
		
		
		local = Time.zone.now
		
		@wakeup_record.time = Time.zone.local(
			local.year,
			local.month,
			local.day,
			@wakeup_record.time.hour,
			@wakeup_record.time.min).in_time_zone(SERVER_TIMEZONE)

		if @wakeup_record.save
			flash[:notice] = '起床愉快!'
		else
			flash[:notice] = '出错'
		end
		redirect_to :root
  end

  # DELETE /wakeup_records/1
  # DELETE /wakeup_records/1.xml
  def destroy
		return "TODO"
    @wakeup_record = WakeupRecord.find(params[:id])
    @wakeup_record.destroy

    respond_to do |format|
      format.html { redirect_to(wakeup_records_url) }
      format.xml  { head :ok }
    end
  end
end
