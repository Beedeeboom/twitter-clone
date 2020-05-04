Rails.application.routes.draw do

  resources :twites do
    post '/comments', to: "comments#create", as: "comments"
    patch '/comments/:comment_id', to: "comments#update"
    delete '/comments/:comment_id', to: "comments#destroy"
    get '/comments/:comment_id', to: "comments#show"
  end

  devise_for :users
  root to: "twites#index"
  resources :users, except: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
