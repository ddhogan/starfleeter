Rails.application.routes.draw do
  
  # sign in with Twitter
  get '/users/auth/twitter' => 'sessions#create'
  get '/auth/twitter' => 'sessions#create'
  
  root 'sessions#welcome'
  # home_path
  get '/home' => 'sessions#home'
  # login_path
  get '/login' => 'sessions#new'
  # create_path
  post '/login' => 'sessions#login'
  # logout_path
  get '/logout' => 'sessions#logout'
 

  # resources :crews do 
  #   resources :ratings, only: [:new, :create, :destroy]
  # end
  resources :crews
  
  # ships_fastest_path
  get '/ships/fastest' => 'ships#fastest'
  
  # ship_assignments, ship_assignment, new_ship_assignment, edit_ship_assignment, etc
  resources :ships do
    resources :assignments
  end

  resources :assignments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
