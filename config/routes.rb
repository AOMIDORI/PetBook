Rails.application.routes.draw do
  get 'static_pages/about'

  get 'sessions/new'
  #get 'sessions/create'
  get 'users/new'

  get 'welcome/index'

  root 'welcome#index'

  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
