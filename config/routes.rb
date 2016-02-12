Rails.application.routes.draw do
  resources :wines, only: [:index, :new, :create, :show, :edit, :update] do
    resources :notes, only: [:new, :create, :edit, :update]
  end
  
  root to: 'home#index'
end
