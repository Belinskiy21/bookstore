Rails.application.routes.draw do


  root 'home#index'


  get 'home/index'

  devise_for :users,  :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :books do
    collection do
      get :newest_first
      get :popular_first
      get :price_descending
      get :price_ascending
      get :title_descending
      get :title_ascending
    end
  end
  resources :orders do
    collection do
      get :in_progress
      get :processing
      get :in_delivery
      get :delivered
      get :canceled
    end
  end
  resources :order_items, only: [:create, :update, :destroy]
  resources :categories, only: [:index, :show]
  resources :carts, only: [:show, :update]
  resources :checkout
  resources :reviews, only: :create
  resources :addresses, only: [:edit, :update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
