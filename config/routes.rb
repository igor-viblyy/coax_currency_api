Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :users, only: [:show] do
    resources :currencies
  end

  root 'base#index'
end
