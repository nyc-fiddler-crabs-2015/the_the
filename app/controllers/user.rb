get '/users/:id' do
  @user = User.find(params[:id])
  @lyrics = @user.lyrics
  erb :'user/profile'
end