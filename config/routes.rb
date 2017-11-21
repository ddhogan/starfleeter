Rails.application.routes.draw do
  resources :missions
  resources :assignments
  resources :crews
  resources :ships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
