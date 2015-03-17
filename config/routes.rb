Rails.application.routes.draw do

  get '/songs/best_of', to: 'songs#best_of'
  resources :songs
  resources :users
  resources :lyrics
  resources :sessions

  # We generally don't ask application to render things
  root 'application#index'

  # We generally don't ask application to render things
  get '/about', to: 'application#about'

  # Both of these probably should go into a controller called
  # PagesController(?) that serves these static-y pages
end
