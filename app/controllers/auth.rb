get '/login' do
  if request.xhr?
    erb :login, layout: false
  else
    erb :login
  end
end


post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.try(:authenticate, params[:password])
    session[:user_id] = user.id
    redirect '/songs'
  else
    redirect '/'
  end
end

post '/login.json' do
  user = User.find_by(username: params[:username])
  content_type :json
  if user && user.try(:authenticate, params[:password])
    session[:user_id] = user.id
    {location: '/songs'}.to_json
  else
    {error: 'match'}.to_json
  end
end


get '/signup' do
  if request.xhr?
    erb :signup, layout: false
  else
    erb :signup
  end
end

post '/signup' do
  password     = params[:password]
  confirmation = params[:password_confirmation]
  user = User.new(email: params[:email], username: params[:username], password: password)
  if user.save && password == confirmation
    session[:user_id] = user.id
    redirect '/songs'
  elsif password != confirmation
    redirect '/'
  else
    redirect '/'
  end
end

post '/signup.json' do
  password     = params[:password]
  confirmation = params[:password_confirmation]
  user = User.new(email: params[:email], username: params[:username], password: password)
  content_type :json
  if user.save && password == confirmation
    session[:user_id] = user.id
    {location: '/songs'}.to_json
  elsif password != confirmation
    {error: 'match'}.to_json
  else
    {error: 'db'}.to_json
  end
end


get '/logout' do
  session[:user_id] = nil
  erb :index
end