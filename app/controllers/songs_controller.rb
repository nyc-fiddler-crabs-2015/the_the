class SongsController < ApplicationController
  def index
    # Migrate this to a model
    render :json => {songs: Song.no_wanted}
  end

  def best_of
    render :json => {songs: Song.best_of}
  end

  def show
    @song = Song.find(params[:id].to_i)
    @lyric = Lyric.new
  end

end
