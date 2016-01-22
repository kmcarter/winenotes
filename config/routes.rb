Rails.application.routes.draw do
  resources :notes, only: [:index]
  root to: 'home#index'
end
