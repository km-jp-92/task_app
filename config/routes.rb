Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :tasks do
    patch :complete, on: :member

    collection do
      get :high_priority
    end
  end
end
