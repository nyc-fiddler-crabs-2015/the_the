class Song < ActiveRecord::Base
  # Only one lyric_id will be in this table, the defaults lyrics.
  belongs_to :lyric
  belongs_to :artist
end