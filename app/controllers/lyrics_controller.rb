class LyricsController < ApplicationController

  def create
    Song.find(lyric_params[:song]).song.lyrics.create(user_id: session[:user_id], text: lyric_params[:text] )
    redirect_to user_home
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

  private

  def lyric_params
    params.require(:lyric).permit(:text, :song)
  end
end
