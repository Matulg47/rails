Rails.application.routes.draw do
  resources :fotos
  resources :precios
  resources :tarts
  resources :otros
  resources :telegrams
  resources :desayunos
  resources :macaroons
  resources :tarta
 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pedidos
  resources :cakes
  resources :homes
  get '/pedidos/continuar', to: 'pedidos#continuar', as: :continuar_pedidos
  # Defines the root path route ("/")
  root "homes#inicio"
  get '/admin', to:'precios#admin'
  post 'identificando', to: 'precios#identificando'
  get '/newFotoD', to: 'fotos#newFotoD'
  post 'subiendo', to:'fotos#subiendo'
end
