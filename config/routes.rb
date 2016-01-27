Rails.application.routes.draw do
  resources :notes, only: [:index]
  resources :wines, only: [:index]
  root to: 'home#index'
end
