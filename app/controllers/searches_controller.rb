class SearchesController < ApplicationController
  def index

    @rants = Rant.all
    if params[:search]
      @rants = Rant.search(params[:search]).order("created_at DESC")
    else
      @rants = Rant.all.order('created_at DESC')
    end

    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end

  end
end
