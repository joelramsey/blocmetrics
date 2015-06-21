Rails.application.routes.draw do

  resources :events, only: [:index, :show]

  resources :registered_applications

  devise_for :users
  resources :users, only: [:show]

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end

  get "welcome/index"
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
