Rails.application.routes.draw do
  devise_for :admins
  get 'admins' => 'admins#index'
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
  get '/acryllic', to: 'main#acryllic'

resources :products do
   get :who_bought, on: :member
end

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  scope '(:locale)' do 
    root 'main#home', as: 'main_home', via: :all
  end 
  
end
