class RantsController < ApplicationController
 def new

 end
 def index
   # form stuff
   @user = current_user
   @new_rant = Rant.new
   # end form stuff

   @user = User.find(params[:user_id])
   @rants = @user.rants.all

 end
 def show
   @user = User.find(params[:id])
   @rant = @user.rant.find(params[:id]) #somethings worng with it
   @new_rant = Rant.new
 end

  def create
    @user = current_user
    @rant = Rant.new(
      title: params[:rant][:title],
      verbage: params[:rant][:verbage],
      user_id: current_user.id
    )
    @rant.save
    redirect_to dashboard_path(current_user)
  end

 def destroy
   @user = User.find(params[:user_id])
   @rant = @user.rants.find(params[:id])
   @rant.destroy
   redirect_to dashboard_path(current_user)
 end

end