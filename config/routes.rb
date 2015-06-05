Rails.application.routes.draw do
  
  

  devise_for :users
  get 'welcome/index'
  get 'about' => 'welcome#about'
  
  resources :registered_applications
  resources :events

  root to: 'welcome#index'
end
