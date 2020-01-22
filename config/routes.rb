Rails.application.routes.draw do
  resources :lunch_menus
  resources :morning_menus
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/rental', to: 'static_pages#rental'
  get '/contact', to: 'static_pages#contact'
  get '/menus', to: 'menu#index'
  get '/new', to: 'menu#new'
  get '/login', to:'sessions#new'
  resources :users
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
