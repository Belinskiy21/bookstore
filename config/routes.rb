Rails.application.routes.draw do
  root 'login#login'

  get 'login/login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
