Rails.application.routes.draw do
  root 'home#index'
  
  get 'home/index'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  get'/auth/:provider/callback' => 'sessions#create'

  get '/signout' => 'sessions#destroy', :as => :signout

  get '/signin' => 'sessions#new', :as => :signin

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
