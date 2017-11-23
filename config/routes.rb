Rails.application.routes.draw do
  
  root 'static#home'
  
  resources :missions
  
  resources :crews
  
  resources :ships do
    resources :assignments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
