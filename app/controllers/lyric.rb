post '/lyrics/new' do
  song = Song.find(params[:song].to_i)
  lyrics = Lyric.create(user_id: session[:user_id],song: song, text: params[:lyrics] )
  new_url = "/users/#{session[:user_id]}/lyrics/#{lyrics.id}"
  content_type :json
  {location: new_url}.to_json
end

get '/users/:user_id/lyrics/:id' do
  @user = User.find(params[:user_id])
  @lyric = Lyric.find(params[:id])
  erb :'lyrics/show'
end

put '/lyrics/:lyric_id/edit' do
  lyric = Lyric.find(params[:lyric_id])
  if lyric.user.id == session[:user_id]
    lyric.update_attributes(text: params[:lyrics])
    new_url = "/users/#{session[:user_id]}"
    content_type :json
    {location: new_url}.to_json
  end
end

delete '/lyrics/:lyric_id/delete' do
  user = User.find(session[:user_id])
  lyric = Lyric.find(params[:lyric_id])
  if user && user.id == lyric.user.id
    lyric.delete
    redirect "/users/#{user.id}"
  end
end
