class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
  skip_before_action :require_login, only: [:new, :create]


  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login @user
      flash[:success] = 'Account was successfully created'
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Account was successfully updated'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'Account was successfully destroyed'
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :authentications_attribute)
    end

end
