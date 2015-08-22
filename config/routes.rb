Rails.application.routes.draw do
  devise_for :users
  resources :users do
    get :download
  end
  root to: 'users#index'
end
