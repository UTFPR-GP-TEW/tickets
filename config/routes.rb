Rails.application.routes.draw do
  resources :conversations
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  resources :tickets
  resources :projects
  
  devise_for :users
  get 'home/index'

end
