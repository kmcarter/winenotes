Rails.application.routes.draw do
  resources :wines, only: [:index, :new, :create, :show] do
    resources :notes, only: [:new, :create, :show]
  end
  
  root to: 'home#index'
end
