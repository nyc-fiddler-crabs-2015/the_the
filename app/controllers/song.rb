get '/songs' do
  no_wanted = Song.where(is_top: true)
  @songs = Song.all - no_wanted
  erb :'songs/all'
end

get '/songs/best_of' do
  @songs = Song.where(is_top: true)
  erb :'songs/best_of'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  @lyrics = Lyric.where(song: @song)
  erb :'songs/show'
end
