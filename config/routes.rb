Rails.application.routes.draw do
  resources :carts
  devise_for :users
  resources :products
root 'main#home'
  get '/home', to: 'main#home'
  get '/catalog', to: 'main#catalog'
  get 'services', to: 'main#services'
  get '/contacts', to: 'main#contacts'
  get '/gallery', to: 'main#gallery'

  
end
