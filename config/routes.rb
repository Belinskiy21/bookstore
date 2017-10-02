Rails.application.routes.draw do


  root 'home#index'


  get 'home/index'

  devise_for :users,  :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :books, only: [:index, :show]
  resources :orders
  resources :order_items, only: [:create, :update, :destroy]
  resources :categories, only: [:index, :show]
  resources :carts, only: [:show, :update]
  resources :checkout




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
