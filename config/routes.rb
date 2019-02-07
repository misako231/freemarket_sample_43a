Rails.application.routes.draw do
  devise_for :users, controllers: {
   registrations: 'users/registrations'
  }
  get '/users', to: redirect("/users/sign_up")
  root to: 'items#index'
  resources :mypage, only: [:new]
  resources :categories, only: [:index, :show]
  resources :item_photos
  resources :items do
    member do
      get :buy
    end
  end
  resources :users, only: [:create] do
    resources :profiles, only: [:index, :new, :create, :show, :update] do
      member do
        get :identification
        get :card
        get :credit
        post :pay
      end
      collection do
        get :logout
        get :done
      end
    end
  end
end
