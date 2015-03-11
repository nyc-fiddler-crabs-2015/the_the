class Song < ActiveRecord::Base
  # Only one lyric_id will be in this table, the defaults lyrics.
  belongs_to :lyric
  has_many :lyrics
  belongs_to :artist

  def lyric_now
    lyrics
  end

  def get_lyrics
    lyric.text
  end
end