class LyricsController < ApplicationController

  def create
    lyric  = params[:lyric]
    song   = Song.find(lyric[:song].to_i)
    lyrics = song.lyrics.create(user_id: session[:user_id], text: lyric[:text] )
    redirect_to "/users/#{session[:user_id]}"
  end


  def show
    @lyric = Lyric.find(params[:id])
  end

  def edit
    @lyric = Lyric.find(params[:id])
    @user = @lyric.user
  end

  def update
    @lyric = Lyric.find(params[:id])
    @lyric.update_attributes(text: params[:lyric])
    redirect_to "/users/#{session[:user_id]}"
  end

  def destroy
    Lyric.delete(params[:id])
    redirect_to "/users/#{session[:user_id]}"
  end
end
