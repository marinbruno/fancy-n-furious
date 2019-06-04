Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :car_wishes, only: [:index, :create, :destroy]

  resources :cars do
    resources :bookings, except: [:index]
    resources :reviews, only: [:index, :create, :destroy]
  end

  get '/users/:id', to: 'profile#show', as: 'profile'
end
