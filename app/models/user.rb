class User < ActiveRecord::Base
  has_secure_password ## makes the password encripted...

  has_many :rants
  validates :username, :first_name, :last_name, :bio, :rant_rate, presence: true

  def self.search(search)
    where("LOWER(username) like LOWER(?) OR LOWER(first_name) like LOWER(?) OR LOWER(last_name) like LOWER(?)", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end