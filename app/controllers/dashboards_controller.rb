class DashboardsController < ApplicationController
  def index

  end

  def show
    # form stuff
    @new_rant = Rant.new
    # end form stuff

    @user = current_user
    @rant = Rant.new
    @rants = @user.rants
    @users = User.where.not(:id => current_user.id)



    @favorites = Favorite.all
  end

  def new

  end

  def create

  end




end