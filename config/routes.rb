Rails.application.routes.draw do
  get 'users/show'

  get 'welcome/index'


  devise_for :users
  root to: 'users#show'
end
