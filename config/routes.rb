Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
  

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  get '/postpage/edit/:id', to: 'microposts#edit'
  get '/postpage/:id', to: 'microposts#show'
  delete '/postpage/:id', to: 'microposts#destroy'
  
  
  resources :microposts, only:[:create, :update]

  resources :microposts, only:[:create, :destroy]
  get '/introduction/edit/:id', to: 'introductions#edit'
  get '/introduction/:id', to: 'introductions#new'
  post '/introductions/:id', to: 'introductions#create'
  patch '/introductions/:id', to: 'introductions#update'
  resources :introductions, only:[:create, :destroy]
  
  get '/chains/:id', to: 'chains#new'
  post '/chains/:id', to: 'chains#create'
  resources :chains, only:[:create, :update]
 end
