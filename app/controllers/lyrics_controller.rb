class LyricsController < ApplicationController

  def create
    # I think this can be more clearly written as:
    #
    # Song.find(params[:song].to_i).lyrics.create(user_id: session[:user_id], text: params[:text])
    # redirect_to user_home
    #
    # This can definitely be written cleaner.

    lyric  = params[:lyric]
    song   = Song.find(lyric[:song].to_i)
    lyrics = song.lyrics.create(user_id: session[:user_id], text: lyric[:text] )

    # Use named routes
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
    redirect_to user_home
  end

  def destroy
    Lyric.delete(params[:id])
    redirect_to user_home
  end
end
