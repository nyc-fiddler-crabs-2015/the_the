class Lyric < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  def get_song
    song
  end

  # Why would Lyric have a get_user method?  You just declared an association
  # right up there?  Why not .user.id; it's a built-in
  def get_user
    user.id
  end

  # Don't commit empty stuff
  def update
  end
end
