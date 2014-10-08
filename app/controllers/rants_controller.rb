class RantsController < ApplicationController
  def new

  end

  def index
    # form stuff
    @user = current_user
    @new_rant = Rant.new
    # end form stuff

    @user = User.find(params[:user_id])
    @rants = @user.rants

  end

  def show
    @user = User.find(params[:user_id])
    @rant = @user.rants.find(params[:id])
    @new_rant = Rant.new
  end

  def create
    @user = current_user
    @rant = Rant.new(rant_allowed_params)
    @rant.save
    redirect_to dashboard_path(current_user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @rant = @user.rants.find(params[:id])
    @rant.destroy
    redirect_to dashboard_path(current_user)
  end


  private

  def rant_allowed_params
    params.require(:rant).permit(:title, :verbage).merge(:user_id => current_user.id)
  end

end