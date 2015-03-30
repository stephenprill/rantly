Rails.application.routes.draw do
  root 'rants#index'
  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'

  get '/sign-in' => 'authentications#new', as: :signin
  post '/sign-in' => 'authentications#create'

  delete '/sign-out' => 'registrations#destroy', as: :signout

  get '/search' => 'rants#index', as: :search

  resources :users
  resources :rants


end
