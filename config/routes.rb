Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "mercari/index", to: "mercari#index"
  get "users/index", to: "users#index"
  get "users/signup", to: "users#new"
  get "users/signup/registration", to: "users#new2"
  get "users/signup/street_address", to: "users#new3"
  get "users/signup/done", to: "users#new5"
  get "users/login", to: "users#new10"
  get "products/new", to: "products#new"
  get "users/logout", to: "users#logout"
end
