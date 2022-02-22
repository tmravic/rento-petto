Rails.application.routes.draw do
  namespace :owner do
    get 'bookings/index'
  end
  devise_for :users
  root to: 'pages#home'
  resources :pets, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update]
  namespace :owner do
    resources :bookings, only: :index
  end

end
