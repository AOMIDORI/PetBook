Rails.application.routes.draw do

  #get 'sessions/create'
  get 'welcome/index'

  root 'welcome#index'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'


  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  #resources :account_activations, only: [:edit]
  #resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
