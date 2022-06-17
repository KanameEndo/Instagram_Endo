Rails.application.routes.draw do
  root 'users#new'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy] do
  end
  resources :users, only: [:new, :create, :show, :edit, :update] do
    member do
      get :favorites
    end
  end
  resources :favorites, only: [:create, :destroy] do
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
