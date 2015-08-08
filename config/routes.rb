Rails.application.routes.draw do
  resources :users
  resources :tags
  resources :houses
  resources :projects do
      resources :comments
  end
    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]
  
    root to: "home#show"
  
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    
    get 'signout', to: 'sessions#destroy', as: 'signout'
    # get '/houses' => 'houses#index'
    # get '/houses/new' => 'house#new'
   
    # post '/houses' => 'houses#index'


end
