Rails.application.routes.draw do
  resources :users
  resources :favorites
  resources :houses
  resources :tags
  resources :projects do
    resources :comments
  end
  
    root to: "home#show"
  
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]


end
