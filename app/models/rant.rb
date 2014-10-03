class Rant < ActiveRecord::Base
  belongs_to :user
  validates :title, :verbage, presence: true
end