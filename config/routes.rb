Rails.application.routes.draw do
  
  resources :users
  resources :attractions

  root 'static_pages#home'
  get '/' => 'static_pages#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  post '/attractions/:id' => 'rides#create'

end