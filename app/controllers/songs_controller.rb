class SongsController < ApplicationController
  def index
    no_wanted = Song.where(is_top: true)
    @songs = Song.all - no_wanted
  end

  def best_of
    @songs = Song.where(is_top: true)
    render 'index.html.erb'
  end

  def show
    @song = Song.find(params[:id].to_i)
    @lyric = Lyric.new
  end

end
