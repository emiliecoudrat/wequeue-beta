Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  resources :lines do
    resources :posts
  end

  resources :posts, only: [] do
      resources :comments
  end

  root to: "home#index"
end

