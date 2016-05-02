Rails.application.routes.draw do
  namespace :admin do
    resources :tickets

    resources :projects

    root 'admin#index'
  end

  get 'home/index'

  root 'home#index'

end
