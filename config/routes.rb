Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/rental', to: 'static_pages#rental'
  get '/contact', to: 'static_pages#contact'
  resources :menus
end
