Rails.application.routes.draw do
  
  root 'sessions#home'
  
  # login_path
  get '/login' => 'sessions#new'
  # create_path
  post '/login' => 'sessions#create'
  
  # signup path
  get '/signup' => 'crews#new'
  post '/signup' => 'crews#create'
  
  # logout_path
  delete '/logout' => 'sessions#logout'

  resources :missions
  
  resources :crews
  
  resources :ships do
    resources :assignments, :missions
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
