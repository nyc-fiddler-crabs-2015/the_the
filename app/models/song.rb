class Song < ActiveRecord::Base
  belongs_to :lyric
  has_many :lyrics
  belongs_to :artist

  def lyric_now
    lyrics
  end

  def get_lyrics
    lyric ? lyric.text : "No lyrics for this song"
  end
end
