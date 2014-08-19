class RegistrationsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      bio: params[:user][:bio],
      rant_rate: params[:user][:rant_rate],
      password: params[:user][:password]
    )

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
end