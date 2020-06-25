Rails.application.routes.draw do
  root to: 'movies#index'
  resources :movies, only: [:index, :new, :create, :edit, :update] do
    collection do
      get 'search'
    end
  end
end
