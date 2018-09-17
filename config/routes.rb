Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :users do
    resources :currencies
  end

  root 'base#index'
end
