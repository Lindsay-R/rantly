class Rant < ActiveRecord::Base
  belongs_to :user
  validates :title, :verbage, presence: true

  def self.search(search)
    where("LOWER(title) like LOWER(?) OR LOWER(verbage) like LOWER(?)", "%#{search}%", "%#{search}%")
  end

end