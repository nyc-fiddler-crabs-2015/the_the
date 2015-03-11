class Lyric < ActiveRecord::Base
  # Only one lyric will be the default of a song
  belongs_to :song
  belongs_to :user
  has_many :votes
end