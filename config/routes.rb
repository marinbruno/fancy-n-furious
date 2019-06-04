Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, except: [:index, :destroy] do
    resources :car_wishes, only: [:index, :create, :destroy]
  end

  resources :cars do
    resources :bookings
    resources :reviews, only: [:index]
  end

  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]

end
