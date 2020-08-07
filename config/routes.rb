Rails.application.routes.draw do
  devise_for :users
  root to: 'movies#index'
  resources :movies, only: [:index, :new, :create, :edit, :update] do
    collection do
      get 'search'
      get 'finely'
    end
  end
  resources :genres, only: [:index, :new, :create]
  resources :ends, only: [:new, :create]
  resources :eras, only: [:new, :create]
end
