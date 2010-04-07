class UsersController < ApplicationController

  # GET /users/1
  def show
    @user = User.find_by_username(params[:id])
		@wakeup_records = WakeupRecord.find(
			:all,
			:conditions => ["user_id = ?", @user.id],
			:order => "id desc",
			:limit => 10
		).reverse

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
	

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id]) if params[:id]
		@user = current_user if not params[:id]
		
		@user.password = ""
		
    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

		if @user.save
			flash[:notice] = 'User was successfully created.'
			sign_in(@user)
		else
		
		end
		redirect_to :root
  end
	
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
		new = params[:user]
		error = nil
		error = '密码不匹配' if new[:password] != new[:password_repeat] and (not new[:password].empty? or not new[:password_repeat].empty?)		
		error = '没权限' if error.nil? and (current_user.nil? or current_user.id != @user.id)
		if not error
			new.delete_if { |k,v|
				k == "password" and v.empty? or
				k == "id" or
				k == "email" or
				k == "username" or
				k == "password_repeat"
			}
			new[:password] = @user.password if new[:password].nil?
			respond_to do |format|
				if @user.update_attributes(new)
					flash[:notice] = '编辑成功'
					format.html { redirect_to :root }
				else
					format.html {
						flash[:notice] = '有错误'
						render :action => "edit"
					}
				end
			end
		else
			respond_to do |format|
					format.html {
						flash[:notice] = error
						render :action => "edit"
					}
			end
		end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
		return "TODO"
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
