Rails.application.routes.draw do

  get 'users/show'

  get 'welcome/index'

  devise_for :users
  root to: 'users#show'

  resources :items

  resources :users do
    resources :items, only: [:create]
  end


    namespace :api do
      resources :users, only: [:index, :show]
      resources :items, only: [:index, :show]
    end

end
