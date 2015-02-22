SampleApp::Application.routes.draw do
  resources :games

  get "games/gameAction"

  delete 'games/destroy'

  get "/games/show"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  root to: 'static_pages#home'
  match '/signup',            to: 'users#new',            via: 'get'
  match '/signin',            to: 'sessions#new',         via: 'get'
  match '/signout',           to: 'sessions#destroy',     via: 'delete'
  match '/help',              to: 'static_pages#help',    via: 'get'
  match '/about',             to: 'static_pages#about',   via: 'get'
  match '/contact',           to: 'static_pages#contact', via: 'get'
  match '/games/destroy/:id', to: 'games#destroy',       via:  'delete'



  match '/apis/login',    to: 'apis#login',		via: 'post'


  #should be get
  match '/apis/getgameinfo/:token', to: 'apis#getgameinfo', via: 'get'

  #should be get
  match 'apis/getaccountinfo', to: 'apis#getaccountinfo', via: 'post'

  match 'apis/score', to: 'apis#score', via: 'put'

  match 'apis/newaccount', to: 'apis#newaccount', via: 'put'
  match 'apis/majaccount', to: 'apis#majaccount', via: 'post'
  match 'apis/deleteaccount', to: 'apis#deleteaccount', via: 'delete'
  match '/games/destroy/:id', to: 'games#destroy',       via:  'delete'

end