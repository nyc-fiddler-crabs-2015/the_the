class SongsController < ApplicationController
  def index
    no_wanted = Song.where(is_top: true)
    @songs = Song.all - no_wanted
    render :json => {songs: @songs}
  end

  def best_of
    @songs = Song.where(is_top: true)
    render :json => {songs: @songs}
  end

  def show
    @song = Song.find(params[:id].to_i)
    @lyric = Lyric.new
  end

end
