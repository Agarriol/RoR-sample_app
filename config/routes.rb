Rails.application.routes.draw do

  root 'static_pages#home'

  #get 'static_pages/help'
  #get 'static_pages/about'
  #get 'static_pages/contact'   #static_pages_contact_path
  #get 'users/new'

  get  '/help',    to: 'static_pages#help', as: 'help' #as :'paco' sería paco_path
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact' #contact_path
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #resources :users #para poder acceder a url/users
  resources :users do
     member do
       get :following, :followers
     end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
