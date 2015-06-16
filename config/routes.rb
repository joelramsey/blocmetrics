Rails.application.routes.draw do
  
  

  devise_for :users
  get 'welcome/index'
  get 'about' => 'welcome#about'
  
  resources :registered_applications
   
  namespace :api, defaults: { format: :json } do
     resources :events, only: [:create]
     match 'events' => "events#create", via: :options, as: :events_options
   end
  root to: 'welcome#index'
end
