Rails.application.routes.draw do
  devise_for :users, controllers: {
   registrations: 'users/registrations', sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks'}
  get '/users', to: redirect("/users/sign_up")
  root to: 'items#index'
  post 'items/:id', to: 'items#charge'
  resources :mypage, only: [:new]
  resources :categories, only: [:index, :show]
  resources :items, only: [:index, :show, :new, :create] do
    resources :favorite_items, only: [:create] do
      collection do
        delete :destroy
      end
    end
    member do
      get :buy
    end
    collection do
      get :search
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:create] do
    resources :creditcards, only: [:create] do
    end
    resources :items, only: [:edit, :update, :destroy] do
      collection do
        get :onsale
        get :orderd
        get :sold
      end
      member do
        get :own
      end
    end
    resources :profiles, only: [:index, :new, :create, :show, :update] do
      member do
        get :identification
        get :card
      end
      collection do
        get :logout
        get :credit
        get :done
      end
    end
  end
end
