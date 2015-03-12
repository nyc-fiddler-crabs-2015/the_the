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
    content_type :json
    session[:user_id] = user.id
    {location: '/songs/best_of'}.to_json
  else
    401
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
  is_valid = (params[:email]=~/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  user = User.new(email: params[:email], username: params[:username], password: password)
  if password == confirmation && is_valid ==0 && user.save
    content_type :json
    session[:user_id] = user.id
    {location: '/songs/best_of'}.to_json
  elsif password != confirmation
    400
  else
    403
  end
end


get '/logout' do
  session[:user_id] = nil
  erb :index
end