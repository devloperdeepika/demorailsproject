Rails.application.routes.draw do
  devise_for :users,  :controllers => {:registrations => "registrations"}
  root to: 'home#index'
  resources :users, only: [:index, :show]
    #match '/users/:id', to: 'users#show', via: 'get'
  resources :stocks do
    member do
      get 'remove'  
    end
  end   
  resources :friendships, only: [:index, :create, :destroy] 
      get '/friendships' => 'friendships#destroy', as: 'destroy_friendship'
        
end
