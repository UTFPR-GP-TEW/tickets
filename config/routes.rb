Rails.application.routes.draw do

  resources :tickets

  resources :projects

  get 'home/index'

  root 'home#index'

end
