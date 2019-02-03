Rails.application.routes.draw do
  devise_for :users, controllers: {
   registrations: 'users/registrations'
  }
  get '/users', to: redirect("/users/sign_up")
  root to: 'mercari#index'
  resources :mypage, only: [:new]
  resources :items do
    member do
      get :buy
    end
  end
  resources :users, only: [] do
    resources :profiles, only: [:index, :new, :create, :show, :update] do
      member do
        get :identification
        get :card
      end
      collection do
        get :logout
        get :done
      end
    end
  end
end
