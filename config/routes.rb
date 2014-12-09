Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  resources :lines do
    resources :comments do
      resources :posts
    end
  end

  root to: "home#index"
end
