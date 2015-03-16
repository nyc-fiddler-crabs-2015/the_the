class Lyric < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  def get_song
    song
  end

  def get_user
    user.id
  end

  def update
  end
end
