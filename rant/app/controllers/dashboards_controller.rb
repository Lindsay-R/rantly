class DashboardsController < ApplicationController
  def index

  end
  def show
    @user = current_user
    @rant = Rant.new
    @rants = @user.rants
    @users = User.all

  end
  def new

  end
  def create


  end


end