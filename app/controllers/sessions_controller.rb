class SessionsController < ApplicationController

  skip_before_filter :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path(current_user)
    else
      @user = User.new(username: params[:user][:username])

      @user.errors[:base] << "Username / password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end