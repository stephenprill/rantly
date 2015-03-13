Rails.application.routes.draw do
  root 'rants#index'
  get '/sign-up' => 'registrations#new', as: :signup
  get '/sign-up' => 'registrations#create'

  resources :users
end
