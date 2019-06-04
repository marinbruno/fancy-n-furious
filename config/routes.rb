Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, except: [:index, :destroy] do
    resources :car_wishes, only: [:index, :create, :destroy]
  end

  resources :cars do
    resources :bookings, except: [:index]
    resources :reviews, only: [:index, :create, :destroy]
  end
end
