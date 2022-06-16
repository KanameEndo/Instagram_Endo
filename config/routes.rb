Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
  end
  resources :favorites, only: [:create, :destroy]
end
