Rails.application.routes.draw do
  resources :articles
  resources :users
  resources :tags
  resources :houses do 
    resources :projects
  end
  resources :projects do
    resources :comments
  end
    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]
  
    root to: "home#show"
  
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    
    get 'signout', to: 'sessions#destroy', as: 'signout'
    


end
