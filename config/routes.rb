Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  resources :users, only:  [:show, :destroy, :edit, :update]
  resources :prototypes do
    resources :comments, only: :create
  end

end
