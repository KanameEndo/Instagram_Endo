Rails.application.routes.draw do
  root 'users#new'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy] do
  end
  resources :users, only: [:new, :create, :show, :edit] do
    member do
      get :favorites
    end
  end
  resources :favorites, only: [:create, :destroy] do
  end
end
