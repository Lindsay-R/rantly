class FollowingRelationship < ActiveRecord::Base
  # overrides class name from Follower/Followed_user to User
  belongs_to :follower, class_name: 'User'
  belongs_to :followed_user, class_name: 'User'
end
