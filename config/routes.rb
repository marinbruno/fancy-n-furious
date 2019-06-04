Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :car_wishes, only: [:index, :create, :destroy]

  resources :cars do
    resources :bookings
    resources :reviews, only: [:index]
  end

  get '/users/:id', to: 'profile#show', as: 'profile'

  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]




end
