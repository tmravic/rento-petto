Rails.application.routes.draw do
  namespace :owner do
    get 'bookings/index'
  end
  devise_for :users
  root to: 'pages#home'
  resources :pets, only: [:index, :show, :new, :create] do
    # GET /pets
    # GET /pets/:pet_id
    # GET /pets/new
    # POST /pets
    resources :bookings, only: [:create]
      # POST /pets/:pet_id/bookings
    resources :reviews, only: [:create]
  end
  resources :bookings, only: [:index, :update]
    # GET /bookings/
    # PATCH /bookings/:booking_id
  namespace :owner do
    resources :bookings, only: :index
      # GET /owner/bookings
  end
end
