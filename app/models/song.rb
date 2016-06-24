class Song < ActiveRecord::Base
  belongs_to :user
  has_many :plays
  has_many :users_played, through: :plays, source: :user
  validates :title, presence: true
  validates :artist, presence: true
end
