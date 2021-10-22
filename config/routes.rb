Rails.application.routes.draw do
  devise_for :users,  :controllers => {:registrations => "registrations"}
  root to: 'home#index'
  get '/all_stock', to: "stocks#all_stock"
  resources :users, only: [:index, :show]
    #match '/users/:id', to: 'users#show', via: 'get'
  resources :stocks do
    member do
      get 'remove'  
    end
    post 'buy_stocks/:stock_id', to: 'stocks#buy_stocks', as: 'buy_stocks'
  end   
  resources :friendships, only: [:index, :create, :destroy] 
      get '/friendships' => 'friendships#destroy', as: 'destroy_friendship'
        
end
