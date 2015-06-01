Rails.application.routes.draw do
  
  devise_for :users
  get 'welcome/index'
  get 'about' => 'welcome#about'
  
  resources :registered_applications

  root to: 'welcome#index'
end
