Rails.application.routes.draw do
  devise_for :users, controllers: {
   registrations: 'users/registrations'
  }
  root to: 'mercari#index'
  get '/users', to: redirect("/users/sign_up")
  resources :mypage, only: [:index, :new]
  resources :profiles, only: [:index, :new]
  get 'items/show', to: 'items#show'
  get 'items/buy', to: 'items#buy'
  get "users/index", to: "users#index"
  get "mypage/signup", to: "mypage#new"
  get "mypage/login", to: "mypage#login"
  get "items/new", to: "items#new"
  get "mypage/identification", to: "mypage#identification"
  get "mypage/logout", to: "mypage#logout"
  get "mypage/profile", to: "mypage#profile"
  get "mypage/card", to: "mypage#card"
end
