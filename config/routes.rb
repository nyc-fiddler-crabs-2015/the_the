Rails.application.routes.draw do

  get '/songs/best_of', to: 'songs#best_of'
  resources :songs
  resources :users
  resources :lyrics
  resources :sessions

  root 'application#index'
  get '/about', to: 'application#about'
end
