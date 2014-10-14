class User < ActiveRecord::Base
  has_secure_password ## makes the password encripted...

  has_many :rants

  has_many :favorites, through: :rants


  # reference upcase vid...
  # needed a join table to connect users following and users being followed
  # reflexive association
  # had to override the foreign_key to get follower_id instead of user_id
  has_many :followed_user_relationships,
           foreign_key: :follower_id,
           class_name: 'FollowingRelationship'
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
           foreign_key: :followed_user_id,
           class_name: 'FollowingRelationship'
  has_many :followers, through: :following_relationships



  validates :username, :first_name, :last_name, :bio, :rant_rate, presence: true

  def self.search(search)
    where("LOWER(username) like LOWER(?) OR LOWER(first_name) like LOWER(?) OR LOWER(last_name) like LOWER(?)", "%#{search}%", "%#{search}%", "%#{search}%")
  end



  def following? user
    followed_user_ids.include? user.id
  end

  def follow user
    followed_users << user
  end

  def unfollow user
    followed_users.delete(user)
  end

  def can_follow? user
    self != user
  end





end