Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms do
    collection do
      get 'search'
    end
  end
  get 'users/:id/room' => 'users#room'
  get 'users/:id/reservation' => 'users#reservation'
  
  resources :reservations
end
