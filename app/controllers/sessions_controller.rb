class SessionsController < ApplicationController
  def new
  end

  def create
    if sign_in(User.authenticate(params[:login], params[:password]))
      redirect_to :root
    else
      flash.now[:notice] = "用户名或者密码不正确"
      render :action => :new
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
    flash[:notice] = '已退出登录'
    redirect_to :root
  end
end
