class Lyric < ActiveRecord::Base
  # Only one lyric will be the default of a song
  belongs_to :song
  belongs_to :user
  def get_song
    song
  end

  def get_user
    user.id
  end
end