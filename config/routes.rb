Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  resources :lines do
    resources :posts do
      resources :comments
    end
  end

  root to: "home#index"
end
