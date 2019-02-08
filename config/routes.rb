Rails.application.routes.draw do
  devise_for :users, controllers: {
   registrations: 'users/registrations'
  }
  get '/users', to: redirect("/users/sign_up")
  root to: 'items#index'
  resources :mypage, only: [:new]
  resources :categories, only: [:index, :show]
  resources :items, only: [:index, :show, :new, :create] do
    member do
      get :buy
    end
  end
  resources :users, only: [:create] do
    resources :items, only: [:edit, :update, :destroy] do
      member do
        get :own
      end
    end
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
