Rails.application.routes.draw do
  get 'items/show', to: 'items#show'
  get "mypage/index", to: "mypage#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "mercari/index", to: "mercari#index"
  get "mypage/index", to: "mypage#index"
  get "mypage/signup", to: "mypage#new"
  get "mypage/signup/registration", to: "mypage#new_registration"
  get "mypage/signup/street_address", to: "mypage#new_street_address"
  get "mypage/signup/done", to: "mypage#new_done"
  get "mypage/login", to: "mypage#login"
  get "products/new", to: "products#new"
  get "mypage/identification", to: "mypage#identification"
  get "mypage/logout", to: "mypage#logout"
  get "mypage/profile", to: "mypage#profile"
  get "mypage/card", to: "mypage#card"
end
