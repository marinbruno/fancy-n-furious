Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :car_wishes, only: [:index, :create, :destroy]


  resources :cars do
    resources :bookings
    resources :reviews, only: [:index]
  end

  get '/users/:id', to: 'profile#show', as: 'profile'
  get 'users/:id/wishes', to: 'profile#wishes', as: 'wishes'
  get 'users/:id/bookings', to: 'profile#bookings', as: 'bookings'

  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]

end
