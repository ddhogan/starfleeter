Rails.application.routes.draw do
  
  # sign in with Twitter
  get '/auth/twitter/callback' => 'sessions#create'
  
  root 'sessions#welcome'
  # home_path
  get '/home' => 'sessions#home'
  # login_path
  get '/login' => 'sessions#new'
  # create_path
  post '/login' => 'sessions#login'
  # logout_path
  get '/logout' => 'sessions#logout'
 

  resources :crews
  
  get '/ships/assignments' => 'assignments#index'
  
  # ships_fastest_path
  get '/ships/fastest' => 'ships#fastest'
  
  # ship_assignments, ship_assignment, new_ship_assignment, edit_ship_assignment, etc
  resources :ships do
    resources :assignments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
