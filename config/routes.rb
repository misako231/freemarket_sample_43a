Rails.application.routes.draw do
  get 'items/show', to: 'items#show'
  get "users/index", to: "users#index"
end
