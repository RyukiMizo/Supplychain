Rails.application.routes.draw do
  get 'notics/link_through'

  get 'sessions/new'

  get 'users/new'
  

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  post '/inquiry', to: 'static_pages#create' 
  get '/privacy', to: 'static_pages#privacy'  
  get '/producer', to: 'static_pages#producer'
  get '/retailing', to: 'static_pages#retailing'
  get '/payform', to: 'static_pages#payform'
  post 'pay', to: 'static_pages#pay'
  get '/law', to: 'static_pages#law'
  
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  get '/postpage/new', to: 'microposts#new'
  get '/postpage/edit/:id', to: 'microposts#edit'
  get '/postpage/:id', to: 'microposts#show'
  get '/postpages/follow', to: 'users#follow_index'
  get 'postpages/like', to: 'microposts#like_index'
  get '/postpages/active', to: 'microposts#active'
  post '/qrcode/:id', to: 'microposts#qrcode'
  get '/postpages', to: 'microposts#index'
  delete '/postpage/:id', to: 'microposts#destroy'
  
  post '/likes/:id', to: 'likes#create'
  resources :likes, only:[:destroy]
  
  
  resources :microposts, only:[:create, :update]

  resources :microposts, only:[:create, :destroy]
  get '/introduction/edit/:id', to: 'introductions#edit'
  get '/introduction/:id', to: 'introductions#new'
  post '/introductions/:id', to: 'introductions#create'
  patch '/introductions/:id', to: 'introductions#update'
  resources :introductions, only:[:create, :destroy]
  
  get '/chains/:id', to: 'chains#new'
  post '/chains/:id', to: 'chains#create'
  delete 'chains/:id', to: 'chains#destroy'
  resources :chains, only:[:update]
  
  resources :relationships, only:[:destroy, :create]
  resources :account_activations, only:[:edit]

  get 'notics/:id/link_through', to: 'notics#link_through',
  as: :link_through
  get 'notics', to: 'notics#index'
 end
