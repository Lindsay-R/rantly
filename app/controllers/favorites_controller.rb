class FavoritesController < ApplicationController
  def index
    # form stuff
    @user = current_user
    @new_rant = Rant.new
    # end form stuff


    @users = User.where.not(:id => current_user.id)
    @favorites = Favorite.all


    @current_user_favorites = @favorites.where("user_id = '#{@user.id}'")

  end

  def create
    Favorite.create(:rant_id => params[:rant_id], :user_id => current_user.id)
    redirect_to :back, notice: "Favorited rant."
  end

  def destroy
    @favorite =Favorite.find_by(:rant_id => params[:rant_id], :user_id => current_user.id)
    @favorite.destroy
    redirect_to :back, notice: "Rant no longer favorited."
  end


end