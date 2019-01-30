Rails.application.routes.draw do
  get 'items/show', to: 'items#show'
  get "users/index", to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "mercari/index", to: "mercari#index"
  get "products/new", to: "products#new"
end
