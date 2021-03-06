Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games, only: [:index, :new, :show, :create] do
    resources :rentals, only: [:new, :create]
  # get  "/users/:id/games/new/", to: "games#new"
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'index', to: 'games#index'
  # get "games/:id", to: "games#show", as: :game
  # post 'games', to: 'games#create'
  end
  get 'index/users/:id/rentals/:id', to: 'rentals#index'
  get '/my_games/', to: 'pages#my_games', as: 'my_games'
end

