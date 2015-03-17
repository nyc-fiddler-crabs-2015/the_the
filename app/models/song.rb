class Song < ActiveRecord::Base
  belongs_to :lyric
  has_many :lyrics
  belongs_to :artist

  def self.best_of
    where(is_top: true)
  end

  def self.no_wanted # wtf does that Mean?
    # OK and what is this about?  Isn't this minus more simplly written as...
    # Song.where(is_top:false) ?
    no_wanted = Song.where(is_top: true) 
    @songs = Song.all - no_wanted
  end

  # Displeased.  WTF does this mean?
  def lyric_now
    lyrics
  end

  def get_lyrics
    lyric ? lyric.text : "No lyrics for this song"
  end
end
