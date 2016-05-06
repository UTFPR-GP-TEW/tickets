Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  namespace :admin do
    resources :tickets
    resources :projects
    root 'admin#index'
  end
  get 'home/index'

  devise_for :users


end
