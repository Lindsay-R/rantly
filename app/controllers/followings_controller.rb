class FollowingsController < ApplicationController


  def index
    # form stuff
    @user = current_user
    @new_rant = Rant.new
    # end form stuff


    @users = User.all
    @followers = FollowingRelationship.all


    @current_user_followings = @followers.where("follower_id = '#{@user.id}'")



  end
end