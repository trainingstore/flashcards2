class SessionsController < ApplicationController
  skip_before_action :require_login, except: :destroy

  def new #login_path
    @user = User.new
  end

  def create #sessions_path
    if login(params[:email], params[:password])
      flash[:success] = 'Login successfully'
      redirect_back_or_to root_path
    else
      flash.now[:warning] = 'Email and/or password is incorrect'
      render action: :new
    end
  end

  def destroy #logout
    logout
    flash[:success] = 'Log out'
    redirect_to root_path
  end
end
