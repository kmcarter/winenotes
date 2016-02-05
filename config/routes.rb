Rails.application.routes.draw do
  resources :notes, only: [:index, :new, :create, :show]
  resources :wines, only: [:index, :new, :create, :show]
  root to: 'home#index'
end
