Rails.application.routes.draw do
  
  

  devise_for :users
  get 'welcome/index'
  get 'about' => 'welcome#about'
  
  resources :registered_applications
   
  namespace :api, defaults: { format: :json } do
     resources :events, only: [:create]
   end
  root to: 'welcome#index'
end
