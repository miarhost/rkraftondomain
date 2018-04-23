Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  devise_for :users
  resources :products
  resources :subscriptions
root 'main#home'
  get '/home', to: 'main#home'
  get '/catalog', to: 'main#catalog'
  get 'services', to: 'main#services'
  get '/contacts', to: 'main#contacts'
  get '/gallery', to: 'main#gallery'

resources :products do
   get :who_bought, on: :member
end
  
end
