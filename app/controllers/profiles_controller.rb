class ProfilesController < ApplicationController
  skip_before_filter :ensure_current_user

  def show
    @user = current_user
    @rants = @user.rants
  end

  def edit
    @user = User.find(params[:id])
  end


end