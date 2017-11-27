Rails.application.routes.draw do
  
  root 'sessions#home'
  
  # login_path
  get '/login' => 'sessions#new'
  # create_path
  post '/login' => 'sessions#login'
  # logout_path
  delete '/logout' => 'sessions#logout'

  resources :crews
  
  resources :assignments
    
  resources :ships do
    resources :assignments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
