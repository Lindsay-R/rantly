class RegistrationsController < ApplicationController

  skip_before_filter :ensure_current_user

  def new
    @user = User.new
  end

  # def show
  #   @user = current_user
  #   @rants = @user.rants.all
  # end

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
      session[:user_id] = @user.id
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(
      username: params[:user][:username],
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      bio: params[:user][:bio],
      rant_rate: params[:user][:rant_rate],
      password: params[:user][:password]
    )
      redirect_to dashboard_path(current_user)
      flash[:notice]= "Profile was updated successfully!"
    else
      render :edit
    end
  end



end