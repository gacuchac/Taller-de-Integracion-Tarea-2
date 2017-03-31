Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "usuario", to: "users#index"
  get "usuario/:id", to: "users#show"
  put "usuario", to: "users#create"
  post "usuario/:id", to: "users#update"
  delete "usuario/:id", to: "users#destroy"

end
