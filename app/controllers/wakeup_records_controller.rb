class WakeupRecordsController < ApplicationController
  before_filter :login_required

  # GET /wakeup_records
  # GET /wakeup_records.xml
  def index
    @wakeup_records = WakeupRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wakeup_records }
    end
  end

  # GET /wakeup_records/1
  # GET /wakeup_records/1.xml
  def show
    @wakeup_record = WakeupRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wakeup_record }
    end
  end

  # GET /wakeup_records/new
  # GET /wakeup_records/new.xml
  def new
    @wakeup_record = WakeupRecord.create current_timezone

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wakeup_record }
    end
  end

  # GET /wakeup_records/1/edit
  def edit
    @wakeup_record = WakeupRecord.find(params[:id])
  end

  # POST /wakeup_records
  # POST /wakeup_records.xml
  def create
    @wakeup_record = WakeupRecord.new(params[:wakeup_record])
	@wakeup_record.user = @current_user
	@wakeup_record.timezone = current_user_session.timezone
	
	
	utc = DateTime.now.new_offset(0)
  tz = current_user_session.tz
	local = current_user_session.tz.utc_to_local utc
	
	@wakeup_record.time = tz.local(
		local.year,
		local.month,
		local.day,
		@wakeup_record.time.hour,
		@wakeup_record.time.min)

	if @wakeup_record.save
		flash[:notice] = '起床愉快!'
	else
		flash[:notice] = '出错'
	end
	redirect_to :root
  end

  # PUT /wakeup_records/1
  # PUT /wakeup_records/1.xml
  def update
    @wakeup_record = WakeupRecord.find(params[:id])

    respond_to do |format|
      if @wakeup_record.update_attributes(params[:wakeup_record])
        flash[:notice] = 'WakeupRecord was successfully updated.'
        format.html { redirect_to(@wakeup_record) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wakeup_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wakeup_records/1
  # DELETE /wakeup_records/1.xml
  def destroy
    @wakeup_record = WakeupRecord.find(params[:id])
    @wakeup_record.destroy

    respond_to do |format|
      format.html { redirect_to(wakeup_records_url) }
      format.xml  { head :ok }
    end
  end
end
