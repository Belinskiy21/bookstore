Rails.application.routes.draw do

  root 'home#index'


  get 'home/index'

  devise_for :users,  :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :books, only: [:index, :show]
  resources :orders
  resources :order_books, only: [:create, :update, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
