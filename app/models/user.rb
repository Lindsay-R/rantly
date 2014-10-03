class User < ActiveRecord::Base
  has_secure_password ## makes the password encripted...

  has_many :rants

  validates :username, :first_name, :last_name, :bio, :rant_rate, presence: true
end