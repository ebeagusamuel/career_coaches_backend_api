Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :coaches, only: [:index]
  resources :appointments, only: [:index, :create, :destroy]

  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
