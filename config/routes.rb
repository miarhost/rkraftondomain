Rails.application.routes.draw do
root 'main#home'
  get '/home', to: 'main#home'
  get '/catalog', to: 'main#catalog'
  get 'services', to: 'main#services'


  
end
