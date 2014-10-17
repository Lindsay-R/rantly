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

    #   @rants.each do |rant|
    #     @rants.favorites = Favorite.where('rant_id',rant.id).count
    # end
    # @favorites = Rants.where('rants.user_id' => @user).joins('rants.id','favorites.rant_id').
  end

  def show
    @new_rant = Rant.new
    @user = User.find(params[:user_id])
    @rant = @user.rants.find(params[:id])
    @favorites = Favorite.all
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