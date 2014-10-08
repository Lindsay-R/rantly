class RegistrationsController < ApplicationController

  skip_before_filter :ensure_current_user

  def new
    @user = User.new
  end

  # def show
  #   @user = current_user
  #   @rants = @user.rants
  # end

  def create

    @user = User.new(user_allowed_params)


    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_allowed_params)
      redirect_to dashboard_path(current_user)
      flash[:notice]= "Profile was updated successfully!"
    else
      render :edit
    end
  end


  private

  def user_allowed_params
    params.require(:user).permit(:username, :first_name, :last_name, :bio, :rant_rate, :password)
    # .merge(:user_id => current_user.id)
  end


end