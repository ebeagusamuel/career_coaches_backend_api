Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create]
  resources :coaches, only: [:index]
  resources :appointments, only: [:index]

  post "/book_appointment", to: "appointments#book_appointment"
  delete "/cancel_appointment", to: "appointments#cancel_appointment"

  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  root to: "users#index"
end
