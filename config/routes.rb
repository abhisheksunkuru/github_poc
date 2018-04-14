Rails.application.routes.draw do
  resources :repos,only: [:index,:show]

  get 'users/new'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'home/index'
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#new"
  # get '/home' => "home#index"
end

