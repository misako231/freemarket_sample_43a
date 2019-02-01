Rails.application.routes.draw do
  get 'items/show', to: 'items#show'
  get 'items/buy', to: 'items#buy'
  get "users/index", to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "mercari/index", to: "mercari#index"
  get "users/index", to: "users#index"
  get "users/signup", to: "users#new"
  get "users/signup/registration", to: "users#new_registration"
  get "users/signup/street_address", to: "users#new_street_address"
  get "users/signup/done", to: "users#new_done"
  get "users/login", to: "users#login"
  get "products/new", to: "products#new"
  get "users/identification", to: "users#identification"
  get "users/logout", to: "users#logout"
  get "users/card", to: "users#card"
end
