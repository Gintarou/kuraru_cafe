Rails.application.routes.draw do
  resources :drink_menus
  resources :lunch_menus
  resources :morning_menus
  resources :sweet_menus
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/rental', to: 'static_pages#rental'
  get '/contact', to: 'static_pages#contact'
  get '/rental/downloadpdf', to: 'static_pages#downloadpdf'
  get '/menus', to: 'menu#index'
  get '/new', to: 'menu#new'
  # resources :users
  # get '/signup', to:'users#new'
  # post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
