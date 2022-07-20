Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resource :rooms, only: [:new, :create, :edit, :update, :destroy] do
    resource :reservations, only: [ :create, :edit, :update, :destroy]
  end
  resources :rooms
  resources :reservations
  get 'users/:id/room' => 'users#room'
  get 'users/:id/reservation' => 'users#reservation'
  get 'rooms/:id/reservation' => 'reservations#new'
  post 'rooms/:id/reservation' => 'reservations#create'
end
