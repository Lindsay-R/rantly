class SessionsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.new(first_name: params[:user][:first_name])
      @user = User.new(last_name: params[:user][:last_name])
      @user = User.new(bio: params[:user][:bio])
      @user = User.new(rant_rate: params[:user][:rant_rate])

      @user.errors[:base] << "Username / password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end