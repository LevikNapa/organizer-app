Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#ghcreate'

  get '/users/most_lists' => 'users#most_lists'

  resources :items
  resources :list_items

  resources :users do
    resources :lists, only: [:new, :create, :index]
  end

  resources :lists do
    resources :list_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
