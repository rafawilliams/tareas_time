Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"
  resources :proyects
  resources :tasks
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
