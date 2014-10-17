class Rant < ActiveRecord::Base
  belongs_to :user
  validates :title, :verbage, presence: true

  has_many :favorites

  def self.search(search)
    where("LOWER(title) like LOWER(?) OR LOWER(verbage) like LOWER(?)", "%#{search}%", "%#{search}%")
  end

  def self.favorite(rant)
    rant.favorites = Favorite.where('rant_id',rant.id).count
  end

  def self.unfavorite(rant)
    rant.favorites = Favorite.where('rant_id',rant.id).count
  end



end