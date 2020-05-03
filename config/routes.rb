Rails.application.routes.draw do
  resources :twites
  devise_for :users
  root to: "twites#index"
  resources :users, except: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
